//
//  DemoTableViewCell.swift
//  MyUIKitApp
//
//  Created by Mikkan Artian on 04.05.2022.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    var ticket: Ticket?
    
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainLabel.textColor = .label
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignTicket(ticket: Ticket) {
        self.ticket = ticket
        numberLabel.text = String(ticket.number)
        if let authorName = ticket.author.name {
            mainLabel.text = authorName
        } else {
            mainLabel.text = "---"
            mainLabel.textColor = .secondaryLabel
        }
    }
    
}
