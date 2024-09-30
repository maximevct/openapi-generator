// OpenAPIDateWithoutTime.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

/// Represents a date without time information (e.g. a birthday) for transmission from and to a REST API
///
/// This type is used as a representation for openapi specs `date` format which does not contain 
/// time information as opposed to the `date-time` format. Although it internally uses `Date` for 
/// (de-)serialization as well the generator needs to be able to distinguish between the two formats. 
/// - note: As `Date` is agnostic to timezones (and calendars), timezone information is needed to be able to add 
/// an appropriate padding in order to transform to GMT+0 which is the assumed timezone in ISO 8601. 
/// When decoding, GMT+0 can be assumed (again: ISO8601) so there is no padding necessary and wrappedDate 
/// can be used safely.
public struct OpenAPIDateWithoutTime: Codable, Hashable, Equatable {
    public let wrappedDate: Date
    public let timezone: TimeZone
    
    public enum CodingKeys: CodingKey, CaseIterable {
        case wrappedDate
        case timezone
    }

    public enum DecodingError: Error {
        case notADateString
    }
    
    /// On decoding ISO8601 timezone is assumed
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let dateString = try container.decode(String.self)
        guard let date = OpenISO8601DateFormatter.withoutTime.date(from: dateString) else {
            throw DecodingError.notADateString
        }
        self.wrappedDate = date

        self.timezone = OpenISO8601DateFormatter.withoutTime.timeZone
    }

    /// Convenience Initializer which is useful when dealing with optionals a lot like e.g. in API mappers
    public init?(wrappedDate: Date?, timezone: TimeZone = .current) {
        guard let wrappedDate = wrappedDate else {
            return nil
        }

        self.init(wrappedDate: wrappedDate, timezone: timezone)
    }

    /// Designated Initializer for `OpenAPIDateWithoutTime`
    ///
    /// Since usually `Date`s without time components - as e.g. birthdays - are created Calendar- and timezone-aware
    // it is important to also provide a timezone so that the generator is able to normalize the supplied Date to ISO8601 (GMT+0)
    public init(wrappedDate: Date, timezone: TimeZone) {
        self.wrappedDate = wrappedDate
        self.timezone = timezone
    }
    
    /// Only the wrappedDate is encoded normalized to GMT+0 with an offset derived from the supplied Timezone
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(OpenISO8601DateFormatter.withoutTime.string(from: normalizedWrappedDate()))
    }

    /// Normalizes the wrappedDate to GMT+0 according to the supplied timezone
    fileprivate func normalizedWrappedDate() -> Date {
        return wrappedDate.addingTimeInterval(
            Double(timezone.secondsFromGMT(for: wrappedDate)))
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        Calendar.current.compare(lhs.wrappedDate, to: rhs.wrappedDate, toGranularity: .day) == .orderedSame
    }
}

extension OpenAPIDateWithoutTime: JSONEncodable {
    func encodeToJSON(codableHelper: CodableHelper) -> Any {
        return OpenISO8601DateFormatter.withoutTime.string(from: self.normalizedWrappedDate())
    }
}

extension OpenAPIDateWithoutTime: RawRepresentable {
    public typealias RawValue = String
    public init?(rawValue: String) {
        if let date = OpenISO8601DateFormatter.withoutTime.date(from: rawValue) {
            self.init(wrappedDate: date)
        } else {
            return nil
        }
    }

    public var rawValue: String {
        OpenISO8601DateFormatter.withoutTime.string(from: normalizedWrappedDate())
    }
}