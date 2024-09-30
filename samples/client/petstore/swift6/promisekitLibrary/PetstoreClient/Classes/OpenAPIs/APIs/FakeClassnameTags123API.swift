//
// FakeClassnameTags123API.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
@preconcurrency import PromiseKit
#if canImport(AnyCodable)
import AnyCodable
#endif

open class FakeClassnameTags123API {

    /**
     To test class name in snake case
     
     - parameter body: (body) client model 
     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: Promise<Client>
     */
    open class func testClassname(body: Client, openAPIClient: OpenAPIClient = OpenAPIClient.shared) -> Promise<Client> {
        let deferred = Promise<Client>.pending()
        testClassnameWithRequestBuilder(body: body, openAPIClient: openAPIClient).execute { result in
            switch result {
            case let .success(response):
                deferred.resolver.fulfill(response.body)
            case let .failure(error):
                deferred.resolver.reject(error)
            }
        }
        return deferred.promise
    }

    /**
     To test class name in snake case
     - PATCH /fake_classname_test
     - To test class name in snake case
     - API Key:
       - type: apiKey api_key_query (QUERY)
       - name: api_key_query
     - parameter body: (body) client model 
     
     - parameter openAPIClient: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<Client> 
     */
    open class func testClassnameWithRequestBuilder(body: Client, openAPIClient: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<Client> {
        let localVariablePath = "/fake_classname_test"
        let localVariableURLString = openAPIClient.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "Content-Type": "application/json",
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Client>.Type = openAPIClient.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "PATCH", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true, openAPIClient: openAPIClient)
    }
}
