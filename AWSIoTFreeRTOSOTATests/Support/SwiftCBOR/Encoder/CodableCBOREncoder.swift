import Foundation

public class CodableCBOREncoder {
    public init() {}

    public func encode(_ value: Encodable) throws -> Data {
        let encoder = _CBOREncoder()
        if let dateVal = value as? Date {
            return Data(CBOR.encodeDate(dateVal))
        } else if let dataVal = value as? Data {
            return Data(CBOR.encodeData(dataVal))
        }
        try value.encode(to: encoder)
        return encoder.data
    }
}

final class _CBOREncoder {
    var codingPath: [CodingKey] = []
    
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    fileprivate var container: CBOREncodingContainer? {
        willSet {
            precondition(self.container == nil)
        }
    }

    var data: Data {
        return container?.data ?? Data()
    }
}

extension _CBOREncoder: Encoder {
    fileprivate func assertCanCreateContainer() {
        precondition(self.container == nil)
    }
    
    func container<Key: CodingKey>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> {
        assertCanCreateContainer()
        
        let container = KeyedContainer<Key>(codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container
        
        return KeyedEncodingContainer(container)
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        assertCanCreateContainer()
        
        let container = UnkeyedContainer(codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container
        
        return container
    }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        assertCanCreateContainer()
        
        let container = SingleValueContainer(codingPath: self.codingPath, userInfo: self.userInfo)
        self.container = container
        
        return container
    }
}

protocol CBOREncodingContainer: class {
    var data: Data { get }
}
