import Foundation

/**

 */
final public class CodableCBORDecoder {
    public init() {}

    public var userInfo: [CodingUserInfoKey : Any] = [:]

    public func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let decoder = _CBORDecoder(data: data)
        decoder.userInfo = self.userInfo
        if type == Date.self {
            guard let cbor = try? CBORDecoder(input: [UInt8](data)).decodeItem(),
                case .date(let date) = cbor
            else {
                let context = DecodingError.Context(codingPath: [], debugDescription: "Unable to decode data for Date")
                throw DecodingError.dataCorrupted(context)
            }
            return date as! T
        } else if type == Data.self {
            guard let cbor = try? CBORDecoder(input: [UInt8](data)).decodeItem(),
                case .byteString(let data) = cbor
            else {
                let context = DecodingError.Context(codingPath: [], debugDescription: "Unable to decode data for Data")
                throw DecodingError.dataCorrupted(context)
            }
            return Data(data) as! T
        }
        return try T(from: decoder)
    }
}

final class _CBORDecoder {
    var codingPath: [CodingKey] = []

    var userInfo: [CodingUserInfoKey : Any] = [:]

    var container: CBORDecodingContainer?
    fileprivate var data: Data

    init(data: Data) {
        self.data = data
    }
}

extension _CBORDecoder: Decoder {
    func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedDecodingContainer<Key> {
        let container = KeyedContainer<Key>(data: self.data, codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container

        return KeyedDecodingContainer(container)
    }

    func unkeyedContainer() -> UnkeyedDecodingContainer {
        let container = UnkeyedContainer(data: self.data, codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container

        return container
    }

    func singleValueContainer() -> SingleValueDecodingContainer {
        let container = SingleValueContainer(data: self.data, codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container

        return container
    }
}

protocol CBORDecodingContainer: class {
    var codingPath: [CodingKey] { get set }

    var userInfo: [CodingUserInfoKey : Any] { get }

    var data: Data { get set }
    var index: Data.Index { get set }
}

extension CBORDecodingContainer {
    func readByte() throws -> UInt8 {
        return try read(1).first!
    }

    func read(_ length: Int) throws -> Data {
        let nextIndex = self.index.advanced(by: length)
        guard nextIndex <= self.data.endIndex else {
            let context = DecodingError.Context(codingPath: self.codingPath, debugDescription: "Unexpected end of data")
            throw DecodingError.dataCorrupted(context)
        }
        defer { self.index = nextIndex }

        return self.data.subdata(in: self.index..<nextIndex)
    }

    func read<T: FixedWidthInteger>(_ type: T.Type) throws -> T {
        let stride = MemoryLayout<T>.stride
        let bytes = [UInt8](try read(stride))
        return T(bytes: bytes)
    }
}
