//
//  UserDetailViewController.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import UIKit

/**
 I havent worked on that screen... (In Progress)
 - commented by: Dimitar
 */
class UserDetailViewController: UIViewController {

    lazy private var centralLabel:UILabel = {
        let lbl = UILabel()
        lbl.frame = CGRect(x: 16,
                           y: (view.frame.size.height / 2) - 40,
                           width: view.frame.size.width - 32,
                           height: 50)
        lbl.textAlignment = .center
        lbl.textColor = .black
        lbl.numberOfLines = 2
        lbl.text = "Module in progress..."
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        view.addSubview(centralLabel)
        // Do any additional setup after loading the view.
    }


}
