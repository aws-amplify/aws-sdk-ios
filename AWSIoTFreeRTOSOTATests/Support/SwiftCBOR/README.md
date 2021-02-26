# SOURCE

[SwiftCBOR](https://github.com/myfreeweb/SwiftCBOR/tree/81e3531569128ffd75478eb823164f5c23958da6)


[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![unlicense](https://img.shields.io/badge/un-license-green.svg?style=flat)](http://unlicense.org)

# SwiftCBOR

A [CBOR (RFC 7049 Concise Binary Object Representation)](http://cbor.io) decoder and encoder in Swift. Encode directly from Swift types or use a wrapper object. Decode to a CBOR value type that can be accessed with native Swift subscripting and expressed with the equivalent literal notation.

- A fully cross-platform Swift 4.x package!
- No `Foundation` dependency (even though it turned out to be supported in the cross-platform version, ha.)
- Negative integers are decoded as `NegativeInt(UInt)`, where the actual number is `-1 - i` (CBOR's negative integers can be larger than 64-bit signed integers).
- Tags are decoded, but not processed. Tagged values are encoded, but not type-checked. Do it yourself :-)
- Literal convertibles are defined for the `CBOR` type!
- And `subscript` too. So you can access CBOR maps and arrays like this: `myDecodedObject["numbers"][1]`.
- If you want to decode from a stream, implement the `CBORInputStream` protocol on your stream and create the decoder like this: `CBORDecoder(stream: yourStream)`.
- Half floats can be decoded to a Float, maybe even correctly. Encoding Float16s are not supported (they do not exist in Swift).
- Memory efficiency of encoding needs tuning. (Encoding is not typically done in-place.)
- Encoding indefinite-length data is supported but you need to explicitly add open and close information to your streaming data.
- [cbor.me](http://cbor.me) is recommended for viewing your CBOR-encoded data.

## Installation

There are many ways: Swift Package Manager, Carthage, CocoaPods, git submodule...

The CocoaPod is [submitted by contributors](https://github.com/myfreeweb/SwiftCBOR/issues/7), updates can be delayed there.
Carthage is the recommended dependency manager for Cocoa projects.

## Decoding

```swift
import SwiftCBOR

let decoded = try! CBOR.decode([0x9f, 0x18, 255, 0x9b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 2, 0x18, 1, 0x79, 0x00, 3, 0x41, 0x42, 0x43, 0x79, 0x00, 3, 0x41, 0x42, 0x43, 0xff])
print(decoded)
// CBOR.array([CBOR.unsignedInt(255), CBOR.array([CBOR.unsignedInt(1), CBOR.utf8String("ABC")]), CBOR.utf8String("ABC")])
```

To unwrap the decoded `CBOR` values, use [PATTERN MATCHING](https://alisoftware.github.io/swift/pattern-matching/2016/05/16/pattern-matching-4/)!!

## Encoding

Encoding a value returns an array of bytes, `[UInt8]`. You can encode with `CBOR.encode(myValue)` or `myValue.encode()`. Any type that conforms to the `CBOREncodable` protocol may be encoded. You can implement the `CBOREncodable` protocol for your types and then encode as usual. 

```swift
CBOR.encode(100)  // --> [0x18, 0x64] of type [UInt8]
Int(100).encode() // --> [0x18, 0x64]. Int conforms to the CBOREncodable protocol
"hello".encode()  // --> [0x65, 0x68, 0x65, 0x6c, 0x6c, 0x6f]. So does String
CBOR.encode(["a", "b", "c"])

let byteString: [UInt8] = [0x01, 0x02]
CBOR.encode(byteString, asByteString: true)
```

Due to Swift's incomplete generics system, you cannot call `someArray.encode()` or `someDictionary.encode()`, but you can simply use `CBOR.encode(someArrayOrMap)` so long as your array items or map key and value types conform to `CBOREncodable`.

In some cases it may be necessary to create a `CBOR` intermediate representation before encoding. For example, if you want to encode an array or dictionary containing heterogeneous types, as is common for JSON-like objects, you can't use native Swift maps yet. You can implement `CBOREncodable` on your type that would build a `CBOR` value and encode that, or do the `CBOR` value thing without `CBOREncodable`.

The `CBOR` enum can be [expressed with literals](https://developer.apple.com/documentation/swift/initialization_with_literals), but note that variables are not literals, so you might have to call the constructors manually.

```swift
public protocol CBOREncodable {
    func encode() -> [UInt8]
}

struct MyStruct: CBOREncodable {
    var x: Int
    var y: String

    public func encode() -> [UInt8] {
        let cborWrapper : CBOR = [
            "x": CBOR(integerLiteral: self.x), // You can use the literal constructors
            "y": CBOR.utf8String(self.y), // Or the enum variants
            "z": 123 // Or literals
        ]
        return cborWrapper.encode()
    }
}

MyStruct(x: 42, y: "words").encode()
// --> bytes (as hex): a2 61 79 65 77 6f 72 64 73 61 78 18 2a
```

The `encode` function doesn't *have* to look like that. If you want to do something custom, like [preserving the order of map keys](https://github.com/myfreeweb/SwiftCBOR/issues/21), you can build the `[UInt8]` manually. Look at the [Encoder functions](https://github.com/myfreeweb/SwiftCBOR/blob/master/SwiftCBOR/CBOREncoder.swift) for inspiration.

### Encoding API

The current general-purpose API is listed below. When you need fine grained control over the type you are encoding, use the following.

```swift
func encode<T: CBOREncodable>(_ value: T) -> [UInt8]
func encode<A: CBOREncodable, B: CBOREncodable>(_ dict: [A: B]) -> [UInt8]

// NOTE: Please see the note on encoding byte strings at the end of this readme.
func encode<T: CBOREncodable>(_ array: [T], asByteString: Bool = false) -> [UInt8]

/// Only needed for fine-grained control:
func encodeUInt{8, 16, 32, 64}(_ x: UInt8) -> [UInt8]
func encodeNegativeInt(_ x: Int) -> [UInt8]
func encodeByteString(_ bs: [UInt8]) -> [UInt8] // does no endian interpretation
func encodeString(_ str: String) -> [UInt8]
func encodeArray<T: CBOREncodable>(_ arr: [T]) -> [UInt8]
func encodeMap<A: CBOREncodable, B: CBOREncodable>(_ map: [A: B]) -> [UInt8]
func encodeTagged<T: CBOREncodable>(tag: UInt8, value: T) -> [UInt8]
func encodeSimpleValue(_ x: UInt8) -> [UInt8]
func encode{Null, Undefined, Break}() -> [UInt8]
func encodeFloat(_ x: Float) -> [UInt8]
func encodeDouble(_ x: Double) -> [UInt8]
func encodeBool(_ x: Bool) -> [UInt8]
```

### Indefinite-length data

To encode indefinite length arrays, maps, strings, and byte strings, explicitly use the open- and close-stream CBOR values. In between these two values, use encoded array and map *chunks* with `CBOR.encodeArrayChunk` and `CBOR.encodeMapChunk`. Indefinite string and bytestrings can be encoded as normal (i.e. they don't need their own 'chunk' function).

```swift
let map: [String: Int] = ["a": 1]
let map2 = ["B": 2]
CBOR.encodeMapStreamStart() + CBOR.encodeMapChunk(map) + CBOR.encodeMapChunk(map2) + CBOR.encodeStreamEnd()

let bs: [UInt8] = [0xf0]
let bs2: [UInt8] = [0xff]
CBOR.encodeByteStringStreamStart()
    + CBOR.encode(bs, asByteString: true)
    + CBOR.encode(bs2, asByteString: true)
    + CBOR.encodeStreamEnd()

// Current stream-encoding API:
func encodeArrayStreamStart() -> [UInt8]
func encodeMapStreamStart() -> [UInt8]
func encodeStringStreamStart() -> [UInt8]
func encodeByteStringStreamStart() -> [UInt8]
func encodeStreamEnd() -> [UInt8] // Equal to CBOR.encodeBreak()
func encodeArrayChunk<T: CBOREncodable>(_ chunk: [T]) -> [UInt8]
func encodeMapChunk<A: CBOREncodable, B: CBOREncodable>(_ map: [A: B]) -> [UInt8]
```

### Note on endian reversal

Finally, a technical note on encoding byte string when using the general purpose array encoder, `CBOR.encode(..)`. If the function parameter `asByteString` is true, then arrays of ALL types EXCEPT UInt8 will be have the raw bytes of each item reversed (but not the order of the items together) if the computer is little endian (CBOR uses big endian or network byte order). Arrays of UInt8, are considered to be already in network byte order.

## Contributing

By participating in this project you agree to follow the [Contributor Code of Conduct](https://contributor-covenant.org/version/1/4/).

[The list of contributors is available on GitHub](https://github.com/myfreeweb/SwiftCBOR/graphs/contributors).

## License

This is free and unencumbered software released into the public domain.  
For more information, please refer to the `UNLICENSE` file or [unlicense.org](https://unlicense.org).
