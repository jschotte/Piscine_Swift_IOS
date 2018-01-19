//
//  ViewController.swift
//  d06
//
//  Created by Jeremy SCHOTTE on 1/16/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dynamic = UIDynamicAnimator()
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    var bounce = UIDynamicItemBehavior()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        gravity.magnitude = 6
        collision.translatesReferenceBoundsIntoBoundary = true
        dynamic = UIDynamicAnimator(referenceView:self.view)
        bounce.elasticity = 0.6
        dynamic.addBehavior(gravity)
        dynamic.addBehavior(collision)
        dynamic.addBehavior(bounce)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBOutlet var touchGesture: UITapGestureRecognizer!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    

    @IBAction func tapScreen(_ sender: UITapGestureRecognizer)
    {
        print("touch at \(sender.location(in: view).x), \(sender.location(in: view).y)")
        touchGesture.cancelsTouchesInView = true
        let newShape = shape(x: sender.location(in: view).x, y: sender.location(in: view).y)
        
        view.addSubview(newShape)
        
        gravity.addItem(newShape)
        collision.addItem(newShape)
        bounce.addItem(newShape)

        touchGesture.cancelsTouchesInView = false
    }
    
    var select : UIView?
    
    @IBAction func changLoc(_ sender: UIPanGestureRecognizer)
    {
        var point:CGPoint = sender.location(in: self.view)

        
        switch sender.state
        {
        case .began:
            print("began")
            self.select = view.hitTest(point, with: nil)
            if self.select != nil
            {
                print("view select")
            }
        case .changed:
            print ("changeds")
        default:
            print ("other")
        }
    }

    
}

