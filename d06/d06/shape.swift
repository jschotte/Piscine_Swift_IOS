//
//  shape.swift
//  d06
//
//  Created by Jeremy SCHOTTE on 1/16/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class shape: UIView {

    init(x: CGFloat, y: CGFloat)
    {
        let diceRoll = Int(arc4random_uniform(2))
        super.init(frame: CGRect(x: x-50, y: y-50, width: 100, height: 100))
        if (diceRoll == 0)
        {
            self.layer.cornerRadius = 50;

        }
        changeColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeColor()
    {
        let diceRoll = Int(arc4random_uniform(6))
        switch diceRoll
        {
        case 0:
            self.backgroundColor = UIColor.yellow
        case 1:
            self.backgroundColor = UIColor.green
        case 2:
            self.backgroundColor = UIColor.cyan
        case 3:
            self.backgroundColor = UIColor.blue
        case 4:
            self.backgroundColor = UIColor.orange
        default:
            self.backgroundColor = UIColor.red

        }
    }
    
    
}
