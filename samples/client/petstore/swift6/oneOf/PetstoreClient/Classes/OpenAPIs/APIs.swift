// APIs.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

@available(*, deprecated, message: "Use `OpenAPIClient` instead")
public typealias PetstoreClientAPI = OpenAPIClient

open class OpenAPIClient: @unchecked Sendable {
    public var basePath: String
    public var customHeaders: [String: String]
    public var credential: URLCredential?
    public var requestBuilderFactory: RequestBuilderFactory
    public var apiResponseQueue: DispatchQueue
    public var codableHelper: CodableHelper

    /// Configures the range of HTTP status codes that will result in a successful response
    ///
    /// If a HTTP status code is outside of this range the response will be interpreted as failed.
    public var successfulStatusCodeRange: Range<Int>

    public init(
        basePath: String = "http://localhost",
        customHeaders: [String: String] = [:],
        credential: URLCredential? = nil,
        requestBuilderFactory: RequestBuilderFactory = URLSessionRequestBuilderFactory(),
        apiResponseQueue: DispatchQueue = .main,
        codableHelper: CodableHelper = CodableHelper(),
        successfulStatusCodeRange: Range<Int> = 200..<300
    ) {
        self.basePath = basePath
        self.customHeaders = customHeaders
        self.credential = credential
        self.requestBuilderFactory = requestBuilderFactory
        self.apiResponseQueue = apiResponseQueue
        self.codableHelper = codableHelper
        self.successfulStatusCodeRange = successfulStatusCodeRange
    }

    public static let shared = OpenAPIClient()
}

open class RequestBuilder<T>: @unchecked Sendable {
    public var credential: URLCredential?
    public var headers: [String: String]
    public let parameters: [String: Any]?
    public let method: String
    public let URLString: String
    public let requestTask: RequestTask = RequestTask()
    public let requiresAuthentication: Bool
    public let client: OpenAPIClient

    /// Optional block to obtain a reference to the request's progress instance when available.
    public var onProgressReady: ((Progress) -> Void)?

    required public init(method: String, URLString: String, parameters: [String: Any]?, headers: [String: String] = [:], requiresAuthentication: Bool, client: OpenAPIClient = OpenAPIClient.shared) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.headers = headers
        self.requiresAuthentication = requiresAuthentication
        self.client = client

        addHeaders(client.customHeaders)
    }

    open func addHeaders(_ aHeaders: [String: String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }

    @discardableResult
    open func execute(completion: @Sendable @escaping (_ result: Swift.Result<Response<T>, ErrorResponse>) -> Void) -> RequestTask {
        return requestTask
    }

    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }

    open func addCredential() -> Self {
        credential = client.credential
        return self
    }
}

public protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type
}
