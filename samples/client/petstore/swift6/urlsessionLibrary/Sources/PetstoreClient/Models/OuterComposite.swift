//
// OuterComposite.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

@available(*, deprecated, renamed: "PetstoreClient.OuterComposite")
public typealias OuterComposite = PetstoreClient.OuterComposite

extension PetstoreClient {

public final class OuterComposite: Codable, JSONEncodable, Hashable {

    public var myNumber: Double?
    public var myString: String?
    public var myBoolean: Bool?

    public init(myNumber: Double? = nil, myString: String? = nil, myBoolean: Bool? = nil) {
        self.myNumber = myNumber
        self.myString = myString
        self.myBoolean = myBoolean
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case myNumber = "my_number"
        case myString = "my_string"
        case myBoolean = "my_boolean"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(myNumber, forKey: .myNumber)
        try container.encodeIfPresent(myString, forKey: .myString)
        try container.encodeIfPresent(myBoolean, forKey: .myBoolean)
    }

    public static func == (lhs: OuterComposite, rhs: OuterComposite) -> Bool {
        lhs.myNumber == rhs.myNumber &&
        lhs.myString == rhs.myString &&
        lhs.myBoolean == rhs.myBoolean
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(myNumber?.hashValue)
        hasher.combine(myString?.hashValue)
        hasher.combine(myBoolean?.hashValue)
        
    }
}

}
