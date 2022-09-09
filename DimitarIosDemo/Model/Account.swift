//
//  Account.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 9.09.22.
//

import Foundation

/**
 1. Class for storing of small non-sense data
 */
struct Account {
    static var isLogged : Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isLogged")
        }
        set (newstate) {
            UserDefaults.standard.set(newstate, forKey: "isLogged")
        }
    }
}
