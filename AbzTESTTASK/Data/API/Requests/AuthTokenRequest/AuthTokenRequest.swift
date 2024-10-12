//
//  AuthTokenRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

/// This enum conforms to the `RequestProtocol` and defines the necessary components for making an API request
/// to obtain an authentication token.
enum AuthTokenRequest: RequestProtocol {
  case auth

  var path: String {
    "/api/v1/token"
  }

  var requestType: RequestType {
      .GET
  }
}
