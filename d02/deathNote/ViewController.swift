//
//  ViewController.swift
//  deathNote
//
//  Created by Jeremy SCHOTTE on 1/10/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var death : [(String, String, String)] = [
        ("Donald Trump","5 mai 2016 14:23:42", "noye dans son vomit"),
        ("Joeffrey Baratheon","5 mai 2016 13:25:20","Empoisonné"),
        ("Ben Solo","12 juilet 2016 05:29:18","Tué par Snoke")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 42
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return death.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deathCell") as? CustomTableViewCell
        cell?.nameLabel?.text = death[indexPath.row].0
        cell?.descrLabel?.text = death[indexPath.row].2
        cell?.dateLabel?.text = death[indexPath.row].1
        cell?.descrLabel.numberOfLines = 0
        return cell!
    }
    
    @IBAction func unWindSegue(_ segue: UIStoryboardSegue)
    {
        print(segue.identifier!)
    }
    
}
