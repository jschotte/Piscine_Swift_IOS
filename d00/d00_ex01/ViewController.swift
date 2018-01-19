//
//  ViewController.swift
//  d00_ex01
//
//  Created by Jeremy SCHOTTE on 1/8/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var current = "0"
    //var left = ""
    var right = "0"
    var opera = ""
    var rightNotNull = false
    
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func negClick(_ sender: UIButton)
    {
        let test1 = testOverflow(x: current);

        current =  String( test1 * -1)
        resultLabel.text = current

    }
    
    @IBAction func numClick(_ sender: UIButton)
    {
        if (opera == "")
        {
            let x: Double = Double(current)! * 10 + Double(sender.tag)

            current = String(x)
            resultLabel.text = current
        }
        else
        {
            let x: Double = Double(right)! * 10 + Double(sender.tag)
            rightNotNull = true
            right = String(x)
            resultLabel.text = right
        }
    }
    
    @IBAction func clearRes(_ sender: UIButton)
    {
        current = "0"
        right = "0"
        opera = ""
        rightNotNull = false
        resultLabel.text = current
    }
    
    @IBAction func equalClick(_ sender: UIButton)
    {
        if (current != "" && rightNotNull)
        {
            makeOpe()
        }
    }
    
    @IBAction func soustractClick(_ sender: UIButton)
    {
        operation(op: "-")
    }
    
    @IBAction func multClick(_ sender: UIButton)
    {
        operation(op: "*")
    }
    
    @IBAction func addClick(_ sender: UIButton)
    {
        operation(op: "+")
    }
    
    @IBAction func divideClick(_ sender: UIButton){
        operation(op: "/")
    }
    
    func operation(op: String)
    {
        if (opera == "")
        {
            opera = op
        }
        else if (opera != "" && rightNotNull)
        {
            makeOpe()
            opera = op
        }
    }
    
    func testOverflow(x: String?)->Double
    {
        var test: Double
        if let result = x
        {
            test = Double(result)!
            return (test)
        }
        return (0)
    }
    
    func makeOpe()
    {
        let test1 = testOverflow(x: current);
        let test2 = testOverflow(x: right);
        var myInt: Double = 0;
        
        if (opera == "+")
        {
            myInt = test1 + test2
        }
        else if (opera == "-")
        {
            myInt = test1 - test2
        }
        else if (opera == "*")
        {
            myInt = test1 * test2
        }
        else if (opera == "/")
        {
            if (test2 == 0 || test1 == 0)
            {
                myInt = 0
            }
            else
            {
                myInt = test1 / test2
            }
        }
        current = String(myInt)
        resultLabel.text = current
        opera = ""
        right = "0"
        rightNotNull = false
    }
    
}

