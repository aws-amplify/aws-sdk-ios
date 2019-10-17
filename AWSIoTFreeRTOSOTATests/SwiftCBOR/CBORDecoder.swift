#if canImport(Foundation)
import Foundation
#endif

public enum CBORError : Error {
    case unfinishedSequence
    case wrongTypeInsideSequence
    case tooLongSequence
    case incorrectUTF8String
}

extension CBOR {
    static public func decode(_ input: [UInt8]) throws -> CBOR? {
        return try CBORDecoder(input: input).decodeItem()
    }
}

public class CBORDecoder {
    private var istream : CBORInputStream

    public init(stream: CBORInputStream) {
        istream = stream
    }

    public init(input: ArraySlice<UInt8>) {
        istream = ArraySliceUInt8(slice: input)
    }

    public init(input: [UInt8]) {
        istream = ArrayUInt8(array: input)
    }

    func readBinaryNumber<T>(_ type: T.Type) throws -> T {
        return UnsafeRawPointer(Array(try istream.popBytes(MemoryLayout<T>.size).reversed())).load(as: T.self)
    }

    func readVarUInt(_ v: UInt8, base: UInt8) throws -> UInt64 {
        guard v > base + 0x17 else { return UInt64(v - base) }

        switch VarUIntSize(rawValue: v) {
        case .uint8: return UInt64(try readBinaryNumber(UInt8.self))
        case .uint16: return UInt64(try readBinaryNumber(UInt16.self))
        case .uint32: return UInt64(try readBinaryNumber(UInt32.self))
        case .uint64: return UInt64(try readBinaryNumber(UInt64.self))
        }
    }

    func readLength(_ v: UInt8, base: UInt8) throws -> Int {
        let n = try readVarUInt(v, base: base)

        guard n <= Int.max else {
            throw CBORError.tooLongSequence
        }

        return Int(n)
    }

    private func readN(_ n: Int) throws -> [CBOR] {
        return try (0..<n).map { _ in
            guard let r = try decodeItem() else { throw CBORError.unfinishedSequence }
            return r
        }
    }

    func readUntilBreak() throws -> [CBOR] {
        var result: [CBOR] = []
        var cur = try decodeItem()
        while cur != CBOR.break {
            guard let curr = cur else { throw CBORError.unfinishedSequence }
            result.append(curr)
            cur = try decodeItem()
        }
        return result
    }

    private func readNPairs(_ n: Int) throws -> [CBOR : CBOR] {
        var result: [CBOR: CBOR] = [:]
        for _ in (0..<n) {
            guard let key  = try decodeItem() else { throw CBORError.unfinishedSequence }
            guard let val  = try decodeItem() else { throw CBORError.unfinishedSequence }
            result[key] = val
        }
        return result
    }

    func readPairsUntilBreak() throws -> [CBOR : CBOR] {
        var result: [CBOR: CBOR] = [:]
        var key = try decodeItem()
        if key == CBOR.break {
            return result
        }
        var val = try decodeItem()
        while key != CBOR.break {
            guard let okey = key else { throw CBORError.unfinishedSequence }
            guard let oval = val else { throw CBORError.unfinishedSequence }
            result[okey] = oval
            do { key = try decodeItem() } catch CBORError.unfinishedSequence { key = nil }
            guard (key != CBOR.break) else { break } // don't eat the val after the break!
            do { val = try decodeItem() } catch CBORError.unfinishedSequence { val = nil }
        }
        return result
    }

    public func decodeItem() throws -> CBOR? {
        let b = try istream.popByte()

        switch b {
        // positive integers
        case 0x00...0x1b:
            return CBOR.unsignedInt(try readVarUInt(b, base: 0x00))

        // negative integers
        case 0x20...0x3b:
            return CBOR.negativeInt(try readVarUInt(b, base: 0x20))

        // byte strings
        case 0x40...0x5b:
            let numBytes = try readLength(b, base: 0x40)
            return CBOR.byteString(Array(try istream.popBytes(numBytes)))
        case 0x5f:
            return CBOR.byteString(try readUntilBreak().flatMap { x -> [UInt8] in
                guard case .byteString(let r) = x else { throw CBORError.wrongTypeInsideSequence }
                return r
            })

        // utf-8 strings
        case 0x60...0x7b:
            let numBytes = try readLength(b, base: 0x60)
            return CBOR.utf8String(try Util.decodeUtf8(try istream.popBytes(numBytes)))
        case 0x7f:
            return CBOR.utf8String(try readUntilBreak().map { x -> String in
                guard case .utf8String(let r) = x else { throw CBORError.wrongTypeInsideSequence }
                return r
            }.joined(separator: ""))

        // arrays
        case 0x80...0x9b:
            let numBytes = try readLength(b, base: 0x80)
            return CBOR.array(try readN(numBytes))
        case 0x9f:
            return CBOR.array(try readUntilBreak())

        // pairs
        case 0xa0...0xbb:
            let numBytes = try readLength(b, base: 0xa0)
            return CBOR.map(try readNPairs(numBytes))
        case 0xbf:
            return CBOR.map(try readPairsUntilBreak())

        // tagged values
        case 0xc0...0xdb:
            let tag = try readVarUInt(b, base: 0xc0)
            guard let item = try decodeItem() else { throw CBORError.unfinishedSequence }
            #if canImport(Foundation)
            if tag == 1 {
                var date: Date
                switch item {
                case .double(let d):
                    date = Date(timeIntervalSince1970: TimeInterval(d))
                case .negativeInt(let n):
                    date = Date(timeIntervalSince1970: TimeInterval(n))
                case .float(let f):
                    date = Date(timeIntervalSince1970: TimeInterval(f))
                case .unsignedInt(let u):
                    date = Date(timeIntervalSince1970: TimeInterval(u))
                default:
                    throw CBORError.wrongTypeInsideSequence
                }
                return CBOR.date(date)
            }
            #endif
            return CBOR.tagged(CBOR.Tag(rawValue: tag), item)

        case 0xe0...0xf3: return CBOR.simple(b - 0xe0)
        case 0xf4: return CBOR.boolean(false)
        case 0xf5: return CBOR.boolean(true)
        case 0xf6: return CBOR.null
        case 0xf7: return CBOR.undefined
        case 0xf8: return CBOR.simple(try istream.popByte())

        case 0xf9:
            return CBOR.half(Util.readFloat16(x: try readBinaryNumber(UInt16.self)))
        case 0xfa:
            return CBOR.float(try readBinaryNumber(Float32.self))
        case 0xfb:
            return CBOR.double(try readBinaryNumber(Float64.self))

        case 0xff: return CBOR.break
        default: return nil
        }
    }

}

private enum VarUIntSize: UInt8 {
    case uint8 = 0
    case uint16 = 1
    case uint32 = 2
    case uint64 = 3

    init(rawValue: UInt8) {
        switch rawValue & 0b11 {
        case 0: self = .uint8
        case 1: self = .uint16
        case 2: self = .uint32
        case 3: self = .uint64
        default: fatalError() // mask only allows values from 0-3
        }
    }
}
