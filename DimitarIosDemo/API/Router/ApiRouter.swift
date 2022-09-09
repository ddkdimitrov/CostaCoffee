//
//  ApiRouter.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

//Folder separation
//Target API separation
//Keychain
//Token

import Foundation

protocol ApiRequestProtocol {
    var path:String {get}
    var httpMethod:ApiRouter.HTTPMethod {get}
    func makeFullRequest() -> URLRequest
}

extension ApiRequestProtocol {
    var request:URLRequest {
        var url = URL(string: ApiRouter.baseURLString)!
        url.appendPathComponent(path)
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.setValue(ApiRouter.headers.serverApiKey, forHTTPHeaderField: "Auth")
        request.setValue(ApiRouter.headers.contentType, forHTTPHeaderField: "Content-Type")
        return request
    }
}

struct ApiRouter {
    
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }
    
    public static var baseURLString: String = "http://dev.ploperations.com/api/"
    fileprivate static var headers = (contentType: "application/json", serverApiKey: "6x721LuTJk")
}
