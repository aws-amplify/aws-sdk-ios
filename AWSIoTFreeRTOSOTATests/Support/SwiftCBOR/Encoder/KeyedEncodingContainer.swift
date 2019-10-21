import Foundation

extension _CBOREncoder {
    final class KeyedContainer<Key: CodingKey> {
        var storage: [AnyCodingKey: CBOREncodingContainer] = [:]

        var codingPath: [CodingKey]
        var userInfo: [CodingUserInfoKey: Any]
        
        init(codingPath: [CodingKey], userInfo: [CodingUserInfoKey : Any]) {
            self.codingPath = codingPath
            self.userInfo = userInfo
        }
    }
}

extension _CBOREncoder.KeyedContainer: KeyedEncodingContainerProtocol {
    func encodeNil(forKey key: Key) throws {
        var container = self.nestedSingleValueContainer(forKey: key)
        try container.encodeNil()
    }
    
    func encode<T: Encodable>(_ value: T, forKey key: Key) throws {
        var container = self.nestedSingleValueContainer(forKey: key)
        try container.encode(value)
    }

    private func nestedCodingPath(forKey key: CodingKey) -> [CodingKey] {
        return self.codingPath + [key]
    }

    private func nestedSingleValueContainer(forKey key: Key) -> SingleValueEncodingContainer {
        let container = _CBOREncoder.SingleValueContainer(
            codingPath: self.nestedCodingPath(forKey: key),
            userInfo: self.userInfo
        )
        self.storage[AnyCodingKey(key)] = container
        return container
    }

    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        let container = _CBOREncoder.UnkeyedContainer(
            codingPath: self.nestedCodingPath(forKey: key),
            userInfo: self.userInfo
        )
        self.storage[AnyCodingKey(key)] = container
        return container
    }
    
    func nestedContainer<NestedKey: CodingKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> {
        let container = _CBOREncoder.KeyedContainer<NestedKey>(
            codingPath: self.nestedCodingPath(forKey: key),
            userInfo: self.userInfo
        )
        self.storage[AnyCodingKey(key)] = container
        return KeyedEncodingContainer(container)
    }
    
    func superEncoder() -> Encoder {
        fatalError("Unimplemented") // FIXME
    }

    func superEncoder(forKey key: Key) -> Encoder {
        fatalError("Unimplemented") // FIXME
    }
}

extension _CBOREncoder.KeyedContainer: CBOREncodingContainer {
    var data: Data {
        // TODO: Check that this works for all sizes of map
        var data: [UInt8] = []
        data = storage.count.encode()
        data[0] = data[0] | 0b101_00000
        for (key, container) in self.storage {
            let keyContainer = _CBOREncoder.SingleValueContainer(codingPath: self.codingPath, userInfo: self.userInfo)
            try! keyContainer.encode(key)
            data.append(contentsOf: keyContainer.data)
            data.append(contentsOf: container.data)
        }

        return Data(data)
    }
}
