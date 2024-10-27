//
//  RequestProtocol.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 02.10.2024.
//

import Foundation

protocol RequestProtocol {
    /// A `String` that represents the base host URL for the API. This is typically the domain of the API server.
    var host: String { get }
    /// A `String` that provides the endpoint for the specific request. This should be appended to the host to form a complete URL.
    var path: String { get }
    /// A `RequestType` indicating the type of HTTP request to be made (e.g., GET, POST, etc.).
    var requestType: RequestType { get }
    /// A dictionary of HTTP headers to be included in the request. This can contain any required headers for authentication or content type.
    var headers: [String: String] { get }
    /// A dictionary containing the parameters to be included in the body of the request. The values can be of any type, depending on the request.
    var params: [String: Any]  { get }
    /// A dictionary of URL parameters to be appended to the request URL. The keys are parameter names, and the values are optional strings.
    var urlParams: [String: String?] { get }
    /// A `Bool` indicating whether the request should include an authorization token. This can be used to enforce token-based authentication.
    var addAuthorisationToken: Bool { get }
    /// An optional `MultipartRequest` for requests requiring `multipart/form-data` encoding.
    /// - This property contains the `MultipartRequest` instance used to handle multipart data, such as file uploads.
    /// - If non-nil, the request will use this data for its HTTP body and set the `Content-Type` header accordingly.
    var multipartFormRequest: MultipartRequest? { get }
}
