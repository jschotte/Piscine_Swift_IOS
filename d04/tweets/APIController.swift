//
//  APIController.swift
//  tweets
//
//  Created by Jeremy SCHOTTE on 1/12/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import UIKit

class APIController: NSObject
{
    weak var delegate : APITwitterDelegate?
    let token : String
    
    init(delegate: APITwitterDelegate?, token: String)
    {
        self.delegate = delegate
        self.token = token
        print(token)
    }
    
    func getTweet(keyword : String)
    {
        var lstTweets : [Tweet] = []
        let params = "q=\(keyword.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)!)&count=100&lang=fr"
        let url = NSURL(string : "https://api.twitter.com/1.1/search/tweets.json?\(params)")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            (data, response, error) in
            //print(response!)
            if error != nil{
                self.delegate!.displayError(e: error! as NSError)
            }
            else if let d = data {
                do {
                    if let dic : NSDictionary = try JSONSerialization.jsonObject(with: d, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                    {
                        DispatchQueue.main.async
                        {
                            if let tweets = dic["statuses"] as? [[String : AnyObject]]
                            {
                                for tweet in tweets
                                {
                                    if let name = tweet["user"]?["name"] as? String
                                    {
                                        if let text = tweet["text"] as? String
                                        {
                                            if let date = tweet["created_at"] as? String
                                            {
                                                let dateformat = DateFormatter()
                                                dateformat.dateFormat = "E, MMM dd HH:mm:ss Z yyyy"
                                                dateformat.timeZone = TimeZone(abbreviation: "GMT+1:00")
                                                let newdate = dateformat.date(from: date)
                                                dateformat.dateFormat = "dd/MM/yyyy HH:mm"
                                                let lastdate = dateformat.string(from: newdate!)
                                                lstTweets.append(Tweet (name: name, text: text, date: lastdate))
                                                //print("\(name) \(text) \(date)")
                                            }
                                        }
                                    }
                                }
                                self.delegate!.processTweet(tweets: lstTweets)
                            }
                        }
                    }
                }
                catch (let err){
                    self.delegate!.displayError(e: err as NSError)
                }
            }
        }
        task.resume()
    }
}
