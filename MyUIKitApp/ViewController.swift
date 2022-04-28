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
        
        guard let url = URL(string: "https://api.claris.su/main/vNext/v1/") else {
            print("Failed to create URL")
            return
        }
        
        var api = ClarisNetworking()
        api.SetURL(url)
        api.LoginRequest(username: "Тест9291", password: "999999") { result in
            switch result {
            case .success(let data):
                print(String(describing: data))
            default:
                print("Error")
            }
        }
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

