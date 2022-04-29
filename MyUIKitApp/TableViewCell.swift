//
//  TableViewCell.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 29.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    var ticket: Ticket?

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }
    
    func assignTicket(ticket: Ticket) {
        self.ticket = ticket
        let label = UILabel()
        if let cellLabel = ticket.author.name {
            label.text = cellLabel
        } else {
            label.text = "Имя не указано"
            label.textColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        }
        label.frame = self.frame
        self.addSubview(label)
    }

}
