//
//  TaskCell.swift
//  To-Do Manager
//
//  Created by Vladislav on 08.02.2022.
//

import UIKit

class TaskCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var symbol: UILabel!
    @IBOutlet var title: UILabel!

}
