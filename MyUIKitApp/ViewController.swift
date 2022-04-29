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
        
        let url = URL(string: "https://api.claris.su/main/vNext/v1/")!
        var api = ClarisNetworking()
        api.SetURL(url)
        
        let group = DispatchGroup()
        group.enter()
        DispatchQueue.global().async {
            api.LoginRequest(username: "Тест9291", password: "999999") { result in
                switch result {
                case .success(let data):
                    api.accessToken = data.access_token
                case .failure(_):
                    print("Login Error")
                }
                group.leave()
            }
        }
        group.wait()
        
        api.getDefaultTickets() { result in
            switch result{
            case .success(let tickets):
                print("Success! Tickets:")
                print(String(describing: tickets))
                self.data = tickets
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let err):
                print(String(describing: err))
            }
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        cell.assignTicket(ticket: data[indexPath.row])
        return cell
    }

}

