//
//  ApiErrorManager.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation


/**
 1. Really small ApiErrorManager tha handles very basic API Errors
 */

struct ApiErrorManager {
    
    enum Errors:Error {
        case connection
        case statusCode
        case jsonDecodeError
        
        var text:String {
            switch self {
            case .connection:
                return "Error connection"
            case .statusCode:
                return "Error status code"
            case .jsonDecodeError:
                return "Error Json decode"
            }
        }
    }
    
    internal static func validate(result:URLResponse) throws {
        guard let response = result as? HTTPURLResponse else {
            throw Errors.connection
        }
        
        guard (200..<300).contains(response.statusCode) else {
            throw Errors.statusCode
        }
    }
}


