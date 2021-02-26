#if canImport(Foundation)
import Foundation
#endif

public indirect enum CBOR : Equatable, Hashable,
        ExpressibleByNilLiteral, ExpressibleByIntegerLiteral, ExpressibleByStringLiteral,
        ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral, ExpressibleByBooleanLiteral,
        ExpressibleByFloatLiteral {

    case unsignedInt(UInt64)
    case negativeInt(UInt64)
    case byteString([UInt8])
    case utf8String(String)
    case array([CBOR])
    case map([CBOR : CBOR])
    case tagged(Tag, CBOR)
    case simple(UInt8)
    case boolean(Bool)
    case null
    case undefined
    case half(Float32)
    case float(Float32)
    case double(Float64)
    case `break`
    #if canImport(Foundation)
    case date(Date)
    #endif

    public func hash(into hasher: inout Hasher) {
        switch self {
        case let .unsignedInt(l): l.hash(into: &hasher)
        case let .negativeInt(l): l.hash(into: &hasher)
        case let .byteString(l):  Util.djb2Hash(l.map { Int($0) }).hash(into: &hasher)
        case let .utf8String(l):  l.hash(into: &hasher)
        case let .array(l):       Util.djb2Hash(l.map { $0.hashValue }).hash(into: &hasher)
        case let .map(l):         Util.djb2Hash(l.map { $0.hashValue &+ $1.hashValue }).hash(into: &hasher)
        case let .tagged(t, l):   t.hash(into: &hasher)
                                  l.hash(into: &hasher)
        case let .simple(l):      l.hash(into: &hasher)
        case let .boolean(l):     l.hash(into: &hasher)
        case .null:               (-1).hash(into: &hasher)
        case .undefined:          (-2).hash(into: &hasher)
        case let .half(l):        l.hash(into: &hasher)
        case let .float(l):       l.hash(into: &hasher)
        case let .double(l):      l.hash(into: &hasher)
        #if canImport(Foundation)
        case let .date(l):        l.hash(into: &hasher)
        #endif
        case .break:              Int.min.hash(into: &hasher)
        }
    }

    public subscript(position: CBOR) -> CBOR? {
        get {
            switch (self, position) {
            case (let .array(l), let .unsignedInt(i)): return l[Int(i)]
            case (let .map(l), let i): return l[i]
            default: return nil
            }
        }
        set(x) {
            switch (self, position) {
            case (var .array(l), let .unsignedInt(i)):
                l[Int(i)] = x!
                self = .array(l)
            case (var .map(l), let i):
                l[i] = x!
                self = .map(l)
            default: break
            }
        }
    }

    public init(nilLiteral: ()) { self = .null }
    public init(integerLiteral value: Int) {
        if value < 0 {
            self = .negativeInt(~UInt64(bitPattern: Int64(value)))
        } else {
            self = .unsignedInt(UInt64(value))
        }
    }
    public init(extendedGraphemeClusterLiteral value: String) { self = .utf8String(value) }
    public init(unicodeScalarLiteral value: String) { self = .utf8String(value) }
    public init(stringLiteral value: String) { self = .utf8String(value) }
    public init(arrayLiteral elements: CBOR...) { self = .array(elements) }
    public init(dictionaryLiteral elements: (CBOR, CBOR)...) {
        var result = [CBOR : CBOR]()
        for (key, value) in elements {
            result[key] = value
        }
        self = .map(result)
    }
    public init(booleanLiteral value: Bool) { self = .boolean(value) }
    public init(floatLiteral value: Float32) { self = .float(value) }

    public static func ==(lhs: CBOR, rhs: CBOR) -> Bool {
        switch (lhs, rhs) {
        case (let .unsignedInt(l), let .unsignedInt(r)): return l == r
        case (let .negativeInt(l), let .negativeInt(r)): return l == r
        case (let .byteString(l),  let .byteString(r)):  return l == r
        case (let .utf8String(l),  let .utf8String(r)):  return l == r
        case (let .array(l),       let .array(r)):       return l == r
        case (let .map(l),         let .map(r)):         return l == r
        case (let .tagged(tl, l),  let .tagged(tr, r)):  return tl == tr && l == r
        case (let .simple(l),      let .simple(r)):      return l == r
        case (let .boolean(l),     let .boolean(r)):     return l == r
        case (.null,               .null):               return true
        case (.undefined,          .undefined):          return true
        case (let .half(l),        let .half(r)):        return l == r
        case (let .float(l),       let .float(r)):       return l == r
        case (let .double(l),      let .double(r)):      return l == r
        #if canImport(Foundation)
        case (let .date(l),        let .date(r)):        return l == r
        #endif
        case (.break,              .break):              return true
        case (.unsignedInt, _): return false
        case (.negativeInt, _): return false
        case (.byteString,  _): return false
        case (.utf8String,  _): return false
        case (.array,       _): return false
        case (.map,         _): return false
        case (.tagged,      _): return false
        case (.simple,      _): return false
        case (.boolean,     _): return false
        case (.null,        _): return false
        case (.undefined,   _): return false
        case (.half,        _): return false
        case (.float,       _): return false
        case (.double,      _): return false
        case (.break,       _): return false
        default:                return false
        }
    }

    public struct Tag: RawRepresentable, Equatable, Hashable {
        public let rawValue: UInt64

        public init(rawValue: UInt64) {
            self.rawValue = rawValue
        }

        public var hashValue : Int {
            return rawValue.hashValue
        }
    }
}

extension CBOR.Tag {
    public static let standardDateTimeString = CBOR.Tag(rawValue: 0)
    public static let epochBasedDateTime = CBOR.Tag(rawValue: 1)
    public static let positiveBignum = CBOR.Tag(rawValue: 2)
    public static let negativeBignum = CBOR.Tag(rawValue: 3)
    public static let decimalFraction = CBOR.Tag(rawValue: 4)
    public static let bigfloat = CBOR.Tag(rawValue: 5)

    // 6...20 unassigned

    public static let expectedConversionToBase64URLEncoding = CBOR.Tag(rawValue: 21)
    public static let expectedConversionToBase64Encoding = CBOR.Tag(rawValue: 22)
    public static let expectedConversionToBase16Encoding = CBOR.Tag(rawValue: 23)
    public static let encodedCBORDataItem = CBOR.Tag(rawValue: 24)

    // 25...31 unassigned

    public static let uri = CBOR.Tag(rawValue: 32)
    public static let base64Url = CBOR.Tag(rawValue: 33)
    public static let base64 = CBOR.Tag(rawValue: 34)
    public static let regularExpression = CBOR.Tag(rawValue: 35)
    public static let mimeMessage = CBOR.Tag(rawValue: 36)
    public static let uuid = CBOR.Tag(rawValue: 37)

    // 38...55798 unassigned

    public static let selfDescribeCBOR = CBOR.Tag(rawValue: 55799)
}

#if os(Linux)
let NSEC_PER_SEC: UInt64 = 1_000_000_000
#endif
