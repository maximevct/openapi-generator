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
internal typealias PetstoreClientAPI = OpenAPIClient

internal class OpenAPIClient: @unchecked Sendable {
    internal var basePath: String
    internal var customHeaders: [String: String]
    internal var credential: URLCredential?
    internal var requestBuilderFactory: RequestBuilderFactory
    internal var apiResponseQueue: DispatchQueue
    internal var codableHelper: CodableHelper

    /// Configures the range of HTTP status codes that will result in a successful response
    ///
    /// If a HTTP status code is outside of this range the response will be interpreted as failed.
    internal var successfulStatusCodeRange: Range<Int>

    internal init(
        basePath: String = "http://petstore.swagger.io:80/v2",
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

    internal static let shared = OpenAPIClient()
}

internal class RequestBuilder<T>: @unchecked Sendable {
    internal var credential: URLCredential?
    internal var headers: [String: String]
    internal let parameters: [String: Any]?
    internal let method: String
    internal let URLString: String
    internal let requestTask: RequestTask = RequestTask()
    internal let requiresAuthentication: Bool
    internal let client: OpenAPIClient

    /// Optional block to obtain a reference to the request's progress instance when available.
    internal var onProgressReady: ((Progress) -> Void)?

    required internal init(method: String, URLString: String, parameters: [String: Any]?, headers: [String: String] = [:], requiresAuthentication: Bool, client: OpenAPIClient = OpenAPIClient.shared) {
        self.method = method
        self.URLString = URLString
        self.parameters = parameters
        self.headers = headers
        self.requiresAuthentication = requiresAuthentication
        self.client = client

        addHeaders(client.customHeaders)
    }

    internal func addHeaders(_ aHeaders: [String: String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }

    @discardableResult
    internal func execute(completion: @Sendable @escaping (_ result: Swift.Result<Response<T>, ErrorResponse>) -> Void) -> RequestTask {
        return requestTask
    }

    internal func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }

    internal func addCredential() -> Self {
        credential = client.credential
        return self
    }
}

internal protocol RequestBuilderFactory {
    func getNonDecodableBuilder<T>() -> RequestBuilder<T>.Type
    func getBuilder<T: Decodable>() -> RequestBuilder<T>.Type
}
