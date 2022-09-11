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
        
        //Adding new case requests related with the Store...
        
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
            //We can add new options in the request based on our needs and switch case
            return self.request
        }
    }
}
