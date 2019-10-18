final class Util {
    // https://stackoverflow.com/questions/24465475/how-can-i-create-a-string-from-utf8-in-swift
    static func decodeUtf8(_ bytes: ArraySlice<UInt8>) throws -> String {
        var result = ""
        var decoder = UTF8()
        var generator = bytes.makeIterator()
        var finished = false
        repeat {
            let decodingResult = decoder.decode(&generator)
            switch decodingResult {
            case .scalarValue(let char):
                result.append(String(char))
            case .emptyInput:
                finished = true
            case .error:
                throw CBORError.incorrectUTF8String
            }
        } while (!finished)
        return result
    }

    static func djb2Hash(_ array: [Int]) -> Int {
        return array.reduce(5381, { hash, elem in ((hash << 5) &+ hash) &+ Int(elem) })
    }

    // https://gist.github.com/martinkallman/5049614
    // rewritten to Swift + applied fixes from comments + added NaN/Inf checks
    // should be good enough, who cares about float16
    static func readFloat16(x: UInt16) -> Float32 {
        if (x & 0x7fff) > 0x7c00 {
            return Float32.nan
        }
        if x == 0x7c00 {
            return Float32.infinity
        }
        if x == 0xfc00 {
            return -Float32.infinity
        }
        var t1 = UInt32(x & 0x7fff)        // Non-sign bits
        var t2 = UInt32(x & 0x8000)        // Sign bit
        let t3 = UInt32(x & 0x7c00)        // Exponent
        t1 <<= 13                          // Align mantissa on MSB
        t2 <<= 16                          // Shift sign bit into position
        t1 += 0x38000000                   // Adjust bias
        t1 = (t3 == 0 ? 0 : t1)            // Denormals-as-zero
        t1 |= t2                           // Re-insert sign bit
        return Float32(bitPattern: t1)
    }
}
