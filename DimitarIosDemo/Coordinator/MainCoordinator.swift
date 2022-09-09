//
//  MainCoordinator.swift
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

class MainCoordinator:Coordinator, Storyboarded {
    
    internal weak var rootViewController: UITabBarController?
    internal var childCoordinators = [Coordinator]()
    
    init() {
        self.rootViewController = self.instantiateViewController(widhIdentifier: "MainTabBarControllerID", withStoryboardName: "Main") as? UITabBarController
    }
    
    internal func start() {
        //Tab 1
        let firstCoordinator = StoreCoordinator()
        firstCoordinator.start()
        self.childCoordinators.append(firstCoordinator)
        let firstViewController = firstCoordinator.rootViewController
        
        //Tab 2
        let secondCoordinator = UserCoordinator()
        secondCoordinator.start()
        self.childCoordinators.append(secondCoordinator)
        let secondViewController = secondCoordinator.rootViewController
        
        //Setup Tab1 and Tab2 VC to the TabBarController
        self.rootViewController?.viewControllers = [firstViewController, secondViewController]
    }
}
