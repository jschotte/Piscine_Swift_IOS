//
//  customCellTableViewCell.swift
//  tweets
//
//  Created by Jeremy SCHOTTE on 1/12/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class customCellTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descr: UILabel!
    @IBOutlet weak var date: UILabel!
    
}
