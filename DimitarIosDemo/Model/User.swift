//
//  User.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

struct User: Encodable, Decodable {
    var loginType:String?
    var email:String?
    var password:String?
    var token:String?
    var firstname:String?
    var lastname:String?
    
    //Custom koding keys using to parse data succesfully to property 'loginType' (API -> 'login_type')
    private enum CodingKeys : String, CodingKey {
        case loginType = "login_type", email, password, token, firstname, lastname
    }
}
