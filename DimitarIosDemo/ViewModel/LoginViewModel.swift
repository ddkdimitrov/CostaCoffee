//
//  LoginViewModel.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

/*
 1. Preferable using the ViewModel protocol inside the same file to be more clear
 2. With LoginViewModelProtocol im doing abstraction that helps to the client to know which basic methods should use.
 3. Making encapsulation of the others methods/properties that the client hasn`t have an access
 - In this demo version point 3/2 are not too much requirement but the demo project is created by following the good practices
 commented by: Dimitar
 */
protocol LoginViewModelProtocol {
    func login(email:String?, password:String?) async -> Bool
}

class LoginViewModel : LoginViewModelProtocol {
    
    private let userApiInst = ApiClient.UserOperation.inst
    
    internal func login(email: String?, password: String?) async -> Bool {
        if validateUserData(email: email, password: password) {
            let generatedSha256Password = (email! + password! + "PizzaLab!OU1").sha256()
            let user = User(loginType: "email", email: email, password: generatedSha256Password)
            
            if let user = await userApiInst.login(user: user), user.token != nil {
                return true
            }
        }
        
        return false
    }
    
    
    private func validateUserData(email:String?, password:String?) -> Bool {
        guard let email = email,
              let password = password else {
              return false
        }
        
        if email.isEmpty() || password.isEmpty() {
            return false
        }
        return true
    }
}
