//
// File.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

@available(*, deprecated, renamed: "PetstoreClientAPI.File")
public typealias File = PetstoreClientAPI.File

extension PetstoreClient {

/** Must be named &#x60;File&#x60; for test. */
public final class File: Codable, JSONEncodable, Hashable {

    /** Test capitalization */
    public var sourceURI: String?

    public init(sourceURI: String? = nil) {
        self.sourceURI = sourceURI
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case sourceURI
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(sourceURI, forKey: .sourceURI)
    }

    public static func == (lhs: File, rhs: File) -> Bool {
        lhs.sourceURI == rhs.sourceURI
        
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(sourceURI?.hashValue)
        
    }
}

}
