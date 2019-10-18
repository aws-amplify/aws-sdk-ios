struct AnyCodingKey: CodingKey, Equatable {
    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }

    init<Key: CodingKey>(_ base: Key) {
        if let intValue = base.intValue {
            self.init(intValue: intValue)!
        } else {
            self.init(stringValue: base.stringValue)!
        }
    }

    func key<K: CodingKey>() -> K {
        if let intValue = self.intValue {
            return K(intValue: intValue)!
        } else {
            return K(stringValue: self.stringValue)!
        }
    }
}

extension AnyCodingKey: Hashable {
    public func hash(into hasher: inout Hasher) {
        self.intValue?.hash(into: &hasher) ?? self.stringValue.hash(into: &hasher)
    }
}

extension AnyCodingKey: Encodable {
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        if let intValue = self.intValue {
            try container.encode(intValue)
        } else {
            try container.encode(self.stringValue)
        }
    }
}

extension AnyCodingKey: Decodable {
    init(from decoder: Decoder) throws {
        let value = try decoder.singleValueContainer()
        if let intValue = try? value.decode(Int.self) {
            self.stringValue = "\(intValue)"
            self.intValue = intValue
        } else {
            self.stringValue = try! value.decode(String.self)
            self.intValue = nil
        }
    }
}
