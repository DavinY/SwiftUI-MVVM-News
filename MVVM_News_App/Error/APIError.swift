//
//  APIError.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}

extension APIError: LocalizedError{
    var errorDescription: String? {
        switch self {
            case .decodingError:
                return "Failed to decode the object from the service"
            case .errorCode(let code):
                return "\(code) - Something went wrong"
            default:
                return "The error is unkown"
        }
    }
}
