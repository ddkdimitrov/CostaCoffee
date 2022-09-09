//
//  CitiesViewController.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import UIKit

/**
 1. Using 'didSelectCell' closure for sendint data and notifying the Coordinator for the redirecting to the next screen
 2. Using async/await helping me to prevent Nested methods call and getting the result without using closure.
 3. Using DataSource and Delegate TableView methods and so basic TableView setup.
 */

class CitiesViewController: UIViewController {

    @IBOutlet weak var tableView:UITableView!
    
    internal var storesViewModel:StoresViewModelAbstractionProtocol!
    internal var didSelectCell:((City) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Cities"
        setupTableView()
        
        Task{
            await storesViewModel.getStores()
            tableView.reloadData()
        }
    }
}



extension CitiesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storesViewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        cell.titleValue = storesViewModel.cities[indexPath.row].name
        return cell
    }
}


extension CitiesViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectCell?(storesViewModel.cities[indexPath.row])
    }
}



extension CitiesViewController {
    private func setupTableView(){
        tableView.register(UINib(nibName: "StoreTableViewCell", bundle: nil), forCellReuseIdentifier: "StoreTableViewCell")
        tableView.tableFooterView = UIView()
    }
}
