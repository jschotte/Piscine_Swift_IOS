//
//  SecondViewController.swift
//  deathNote
//
//  Created by Jeremy SCHOTTE on 1/10/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var dateText: UIDatePicker!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let todaysDate = Date()
        dateText.minimumDate = todaysDate
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "backsegue" {
            if let vc = segue.destination as? ViewController
            {
                if (nameText.text! != "")
                {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMMM YYYY hh:mm:ss"
                    dateFormatter.locale = Locale(identifier: "fr_FR")
                    
                    let dateString = dateFormatter.string(from: dateText.date)
                    print(nameText.text!)
                    print(dateString)
                    print(descriptionText.text!)

                    vc.death.append((nameText.text!,
                                     dateString,
                                    descriptionText.text!))
                    vc.tableView.reloadData()
                }
            }
            //debugPrint("42")
        }
    }

    @IBAction func backButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "backsegue", sender: "test")
    }
}
