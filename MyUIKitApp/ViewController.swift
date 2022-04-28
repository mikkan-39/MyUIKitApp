//
//  ViewController.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 22.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var data = [Ticket]()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.frame = view.frame
        tableView.dataSource = self
        view.addSubview(tableView)
        
        data = LoginAndGetTickets(username: "Тест9291", password: "999999")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        let label = UILabel()
        label.text = String(indexPath.row)
        label.frame = tableViewCell.frame
        tableViewCell.addSubview(label)
        return tableViewCell
    }

}

