//
//  ViewController.swift
//  tweets
//
//  Created by Jeremy SCHOTTE on 1/12/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit



struct Tweet : CustomStringConvertible
{
    var description: String
    {
        get{
            return "(\(name), \(text), \(date))"
        }
    }
    
    var name: String
    var text: String
    var date: String
}

class ViewController: UIViewController, APITwitterDelegate, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    func processTweet(tweets: [Tweet])
    {
        self.tweets = tweets
        tableView.reloadData()
    }
    
    func displayError(e: NSError)
    {
        let myalert = UIAlertController(title: "Error", message: NSError.description(), preferredStyle: UIAlertControllerStyle.alert)
        
        myalert.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            print("Selected")
        })
        self.present(myalert, animated: true)
    }
    

    
    @IBOutlet weak var tableView: UITableView!
    var token : String? = nil
    var API : APIController?
    var tweets : [Tweet] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        if (token == nil)
        {
            getTokenAccess()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tweets.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell") as? inputCell
            cell?.inputText.delegate = self
            return cell!
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as? customCellTableViewCell
            cell?.name?.text = tweets[indexPath.row - 1].name
            cell?.descr?.text = tweets[indexPath.row - 1].text
            cell?.date?.text = tweets[indexPath.row - 1].date
            
            cell?.descr.numberOfLines = 0
            
            cell?.name.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
            cell?.date.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
            cell?.descr.font = UIFont(name:"HelveticaNeue", size: 18.0)
            return cell!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.view.endEditing(true)
        if (textField.text != "")
        {
            API?.getTweet(keyword: textField.text!)
        }
        return true
    }


    
    func getTokenAccess()
    {
        let CUSTOMER_KEY = "moMvFMY9WaQMbygpiA2c0EBXM"
        let CUSTOMER_SECRET = "MHACDymHBlNpyc7Ih4vfK6vzREe8j3GyDO4gbtV2n91oClIpbq"
        let BEARER = ((CUSTOMER_KEY + ":" + CUSTOMER_SECRET).data(using: String.Encoding.utf8))!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
        let url = NSURL(string: "https://api.twitter.com/oauth2/token")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST"
        request.setValue("Basic " + BEARER, forHTTPHeaderField: "Authorization")
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = "grant_type=client_credentials".data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            (data, response, error) in
            //print(response!)
            if error != nil{
                self.displayError(e: error! as NSError)
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    {
                        self.token = dic["access_token"] as? String
                        self.API = APIController(delegate: self, token: self.token!)
                        //self.API?.getTweet(keyword: "ecole 42")

                    }
                }
                catch (let err){
                    self.displayError(e: err as NSError)
                }
            }
        }
        task.resume()
    }
}

