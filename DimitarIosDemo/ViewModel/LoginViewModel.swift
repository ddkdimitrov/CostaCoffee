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
    
    internal func login(email: String?, password: String?) async -> Bool {
        let user = User(email: email, password: password)
        if validateUserData(data: user) {
            let generatedPassword = (email! + password! + "PizzaLab!OU1").sha256()
            let user = User(loginType: "email", email: email, password: generatedPassword)
            
            let inst = ApiClient.UserOperation.inst
            if let user = await inst.login(user: user), user.token != nil {
                return true
            }
        }
        
        return false
    }
    
    private func validateUserData(data:User) -> Bool {
        guard let email = data.email,
              let password = data.password else {
              return false
        }
        
        if email.isEmpty() || password.isEmpty() {
            return false
        }
        return true
    }
}
