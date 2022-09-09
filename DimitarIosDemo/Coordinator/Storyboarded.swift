//
//  Storyboarded.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation
import UIKit

protocol Storyboarded {
    func instantiateViewController(widhIdentifier identifier: String, withStoryboardName name:String) -> UIViewController
}


extension Storyboarded {
    func instantiateViewController(widhIdentifier identifier: String, withStoryboardName name:String) -> UIViewController {
        
        var storyboard: UIStoryboard
        
        storyboard = UIStoryboard(name: name, bundle: .main)
        
        return storyboard.instantiateViewController(withIdentifier: identifier)
       
    }
    
    func instantiateTabBarController(widhIdentifier identifier: String, withStoryboardName name:String) -> UITabBarController {
        
        var storyboard: UIStoryboard
        
        storyboard = UIStoryboard(name: name, bundle: .main)
        
        return storyboard.instantiateViewController(withIdentifier: identifier) as! UITabBarController
       
    }
}
