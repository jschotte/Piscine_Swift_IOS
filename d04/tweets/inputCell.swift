//
//  inputCell.swift
//  tweets
//
//  Created by Jeremy SCHOTTE on 1/12/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class inputCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBOutlet weak var inputText: UITextField!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
