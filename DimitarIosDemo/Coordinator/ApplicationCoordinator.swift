//
//  ApplicationCoordinator.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation
import UIKit

/*
 1. ApplicationCoordinator is the first one when we open the App. It determines if we gonna in Login screen or passing us to the Main screen of the App
 2. Using 'window' to instantiate the Root Controller
 3. In some places using and Dependancy Injection to pass Instances to the services/view models that we are using with our MVVM + C architect pattern.
 4. In that short demo version we are using Storyboards without segues and the most Coordinators confirm Storyboarded protocol that allows to use Storyboard extension method.
 */

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    var isLogged:Bool

    init(window: UIWindow, isLogged:Bool) {
        self.window = window
        self.isLogged = isLogged
    }
    
    func start() {
        if isLogged {
            let mainCoordinator = MainCoordinator()
            mainCoordinator.start()
            self.window.rootViewController = mainCoordinator.rootViewController
            return
        }
        
        let loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator.start()
        self.window.rootViewController = loginCoordinator.rootViewController
    }
}
