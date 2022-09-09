//
//  Store.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

struct Store: Decodable {
    var id: String
    var name: String
    var city: String
    var address: String
    var latitude: String
    var longitude: String
}
