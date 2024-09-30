//
// StoreAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal class StoreAPI {

    /**
     Delete purchase order by ID
     
     - parameter orderId: (path) ID of the order that needs to be deleted 
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - parameter completion: completion handler to receive the result
     */
    @discardableResult
    internal class func deleteOrder(orderId: String, client: OpenAPIClient = OpenAPIClient.shared, completion: @Sendable @escaping (_ result: Swift.Result<Void, ErrorResponse>) -> Void) -> RequestTask {
        return deleteOrderWithRequestBuilder(orderId: orderId, client: client).execute(apiResponseQueue) { result in
            switch result {
            case .success:
                completion(.success(()))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /**
     Delete purchase order by ID
     - DELETE /store/order/{order_id}
     - For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
     - parameter orderId: (path) ID of the order that needs to be deleted 
     
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<Void> 
     */
    internal class func deleteOrderWithRequestBuilder(orderId: String, client: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<Void> {
        var localVariablePath = "/store/order/{order_id}"
        let orderIdPreEscape = "\(APIHelper.mapValueToPathItem(orderId))"
        let orderIdPostEscape = orderIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{order_id}", with: orderIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = client.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Void>.Type = client.requestBuilderFactory.getNonDecodableBuilder()

        return localVariableRequestBuilder.init(method: "DELETE", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, client: client)
    }

    /**
     Returns pet inventories by status
     
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - parameter completion: completion handler to receive the result
     */
    @discardableResult
    internal class func getInventory(client: OpenAPIClient = OpenAPIClient.shared, completion: @Sendable @escaping (_ result: Swift.Result<[String: Int], ErrorResponse>) -> Void) -> RequestTask {
        return getInventoryWithRequestBuilder(client: client).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(.success(response.body))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /**
     Returns pet inventories by status
     - GET /store/inventory
     - Returns a map of status codes to quantities
     - API Key:
       - type: apiKey api_key (HEADER)
       - name: api_key

     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<[String: Int]> 
     */
    internal class func getInventoryWithRequestBuilder(client: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<[String: Int]> {
        let localVariablePath = "/store/inventory"
        let localVariableURLString = client.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<[String: Int]>.Type = client.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: true, client: client)
    }

    /**
     Find purchase order by ID
     
     - parameter orderId: (path) ID of pet that needs to be fetched 
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - parameter completion: completion handler to receive the result
     */
    @discardableResult
    internal class func getOrderById(orderId: Int64, client: OpenAPIClient = OpenAPIClient.shared, completion: @Sendable @escaping (_ result: Swift.Result<Order, ErrorResponse>) -> Void) -> RequestTask {
        return getOrderByIdWithRequestBuilder(orderId: orderId, client: client).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(.success(response.body))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /**
     Find purchase order by ID
     - GET /store/order/{order_id}
     - For valid response try integer IDs with value <= 5 or > 10. Other values will generate exceptions
     - parameter orderId: (path) ID of pet that needs to be fetched 
     
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<Order> 
     */
    internal class func getOrderByIdWithRequestBuilder(orderId: Int64, client: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<Order> {
        var localVariablePath = "/store/order/{order_id}"
        let orderIdPreEscape = "\(APIHelper.mapValueToPathItem(orderId))"
        let orderIdPostEscape = orderIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{order_id}", with: orderIdPostEscape, options: .literal, range: nil)
        let localVariableURLString = client.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = client.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, client: client)
    }

    /**
     Place an order for a pet
     
     - parameter body: (body) order placed for purchasing the pet 
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - parameter completion: completion handler to receive the result
     */
    @discardableResult
    internal class func placeOrder(body: Order, client: OpenAPIClient = OpenAPIClient.shared, completion: @Sendable @escaping (_ result: Swift.Result<Order, ErrorResponse>) -> Void) -> RequestTask {
        return placeOrderWithRequestBuilder(body: body, client: client).execute(apiResponseQueue) { result in
            switch result {
            case let .success(response):
                completion(.success(response.body))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    /**
     Place an order for a pet
     - POST /store/order
     - parameter body: (body) order placed for purchasing the pet 
     
     - parameter client: The OpenAPIClient that contains the configuration for the http request.
     - returns: RequestBuilder<Order> 
     */
    internal class func placeOrderWithRequestBuilder(body: Order, client: OpenAPIClient = OpenAPIClient.shared) -> RequestBuilder<Order> {
        let localVariablePath = "/store/order"
        let localVariableURLString = client.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Order>.Type = client.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false, client: client)
    }
}
