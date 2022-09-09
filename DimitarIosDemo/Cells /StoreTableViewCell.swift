//
//  StoreTableViewCell.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 8.09.22.
//

import UIKit


/**
 We can use for styling:
 1. Template design pattern for styling the cell
 2. Inheritance
 
 We can bind the cell with the VC:
 1. Combine/SwiftRx for binding between Cell and ViewController
 2. Delegate desigh pattern
 3. Using Closures
 In that short demo version thats not created
 - commented by: Dimitar
 */
class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var title:UILabel!
    public var testClosure: ((String) -> Void)?
    
    internal var titleValue:String? {
        didSet {
            title.text = titleValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        testClosure?(title.text ?? "testtt")
        // Configure the view for the selected state
    }
}
