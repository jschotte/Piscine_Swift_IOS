//
//  APITwitterDelegate.swift
//  tweets
//
//  Created by Jeremy SCHOTTE on 1/12/18.
//  Copyright © 2018 Jeremy SCHOTTE. All rights reserved.
//

import Foundation

protocol APITwitterDelegate : class
{
    func processTweet(tweets: [Tweet])
    func displayError(e: NSError)
}
