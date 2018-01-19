//
//  ViewController.swift
//  Syri
//
//  Created by Jeremy SCHOTTE on 1/17/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO


class ViewController: UIViewController {

    var bot : RecastAIClient = RecastAIClient(token : "4250e84991f279f6febf465f9cedf9b1", language: "en")
    var client: DarkSkyClient = DarkSkyClient(apiKey: "45b2cfff694070f93ad9adb3c003fdc8")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client.language = .english

    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var inputLbl: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClick(_ sender: UIButton)
    {
        //Call makeRequest with string parameter to make a text request
        if (inputLbl.text != "")
        {
            self.bot.textRequest((inputLbl?.text)!, successHandler: recastRequestDone, failureHandle: recastRequestFail)
        }
    }
    
    func recastRequestDone(_ response : Response)
    {
        if (response.entities?["location"] != nil)
        {
            let loc = response.entities?["location"] as! [[String: Any]]
            
            let latitute = loc[0]["lat"] as! Double
            let longitude = loc[0]["lng"] as! Double
            
            client.getForecast(latitude: latitute, longitude: longitude) { result in
                switch result {
                case .success(let currentForecast, _):
                    DispatchQueue.main.async
                    {
                        self.label.text = "\(String(describing: (currentForecast.currently?.summary)!))"
                    }
                    break
                case .failure(_):
                    self.label.text = "Error"
                    break
                }
            }
        }
        else
        {
            label.text = "Error"
        }
    }
    
    func recastRequestFail(error : Error)
    {
        label.text = "Error"
    }
}

