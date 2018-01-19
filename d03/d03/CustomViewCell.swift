//
//  CustomViewCell.swift
//  d03
//
//  Created by Jeremy SCHOTTE on 1/11/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    

    override func awakeFromNib()
    {
        self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        self.backgroundColor = UIColor.black
        self.indicator.startAnimating()
        self.image.isUserInteractionEnabled = false
        //self.button.isHidden = true
    }
    

    override func prepareForReuse()
    {
        self.indicator.startAnimating()
        self.backgroundColor = UIColor.black
        self.image.isUserInteractionEnabled = false

    }
    
}
