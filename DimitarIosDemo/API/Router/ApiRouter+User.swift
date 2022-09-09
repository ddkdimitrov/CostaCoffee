//
//  ApiRouter+User.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

/*
 1. Using 'ApiRequestProtocol' for creating API request and protocol property extension called 'request'.
 */
extension ApiRouter {
    
    enum UserRouter: ApiRequestProtocol {

        case login(data:Data)
        case updateUser([String:Any])
        
        //Adding new case requests related with the User...
        
        var path: String {
            switch self {
            case .login:
                return "customer/login"
                
            case .updateUser:
                return "user/update"
            }
        }
        
        var httpMethod: HTTPMethod {
            switch self {
            case .login:
                return .post
                
            case .updateUser:
                return .post
            }
        }
        
        func makeFullRequest() -> URLRequest {
            var request = self.request
            switch self {
                case .login(let data):
                request.httpBody = data
            default:
                break
            }
            
            return request
        }
    }
}
