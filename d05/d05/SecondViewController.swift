//
//  SecondViewController.swift
//  d05
//
//  Created by Jeremy SCHOTTE on 1/15/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    static var lstPin:[(String, String, Double, Double)] = [("Ecole 42", "Wow", 48.896748, 2.318515),("Ecole 42 USA", "USA", 37.548923, -122.059227),("Tour Eiffel", "paris", 48.858504, 2.294449)]


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return SecondViewController.lstPin.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "namePlace")
        cell?.textLabel?.text = SecondViewController.lstPin[indexPath.row].0
        return cell!
    }
}

