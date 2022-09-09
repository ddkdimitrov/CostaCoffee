//
//  ApiRouter+Store.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

/*
 1. Using 'ApiRequestProtocol' for creating API request and protocol property extension called 'request'.
 */
extension ApiRouter {
    
    enum StoreRouter: ApiRequestProtocol {

        case getStores
        case getStoreById(Int)
        
        var path: String {
            switch self {
            case .getStores:
                return "stores/cities"
                
            case .getStoreById(let id):
                return "menu/store/\(id)"
                
            }
        }
        
        var httpMethod: HTTPMethod {
            switch self {
            case .getStores:
                return .get
                
            case .getStoreById:
                return .get

            }
        }
        
        func makeFullRequest() -> URLRequest {
            return self.request
        }
    }
}