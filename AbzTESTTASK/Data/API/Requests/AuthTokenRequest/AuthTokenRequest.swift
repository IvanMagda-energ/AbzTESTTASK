//
//  AuthTokenRequest.swift
//  AbzTESTTASK
//
//  Created by Ivan Magda on 08.10.2024.
//

import Foundation

enum AuthTokenRequest: RequestProtocol {
  case auth

  var path: String {
    "/api/v1/token"
  }

  var requestType: RequestType {
      .GET
  }
}
