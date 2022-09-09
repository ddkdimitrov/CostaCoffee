//
//  LoginViewController.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import UIKit

/**
 1. Using 'isUserLogged' closure to notify the Coordinator for the redirecting
 2. Using async/await helping me to prevent Nested methods (in that case we dont have nestes calls) call and getting the result without using closure.
 - commented by: Dimitar
 */
class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield:UITextField!
    @IBOutlet weak var passwordTextfield:UITextField!
    
    internal var loginViewModel:LoginViewModelProtocol!
    internal var goToNextScreen: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextfield.text = "ddk.dimitrov@gmail.com"
        passwordTextfield.text = "abv123"
    }
}



//MARK:Actions
extension LoginViewController {
    @IBAction func tappedLoginButton(_ sender:Any){
        let email = emailTextfield.text
        let password = passwordTextfield.text
        Task {
            let isLogged = await loginViewModel.login(email: email, password: password)
            if isLogged {
                Account.isLogged = true
                goToNextScreen?()
            }
        }
    }
}
