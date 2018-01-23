//
//  ViewController.swift
//  jschotte2018
//
//  Created by jschotte on 01/19/2018.
//  Copyright (c) 2018 jschotte. All rights reserved.
//

import UIKit
import jschotte2018
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let manager = ArticleManager(completionClosure:
        {
            DispatchQueue.main.async {
                return
            }
        })
        
        
       /* let article1 = manager.newArticle()
        article1.title = "Article 1"
        article1.content = "contenu 1"
        article1.date_update = NSDate()
        article1.date_create = NSDate()
        article1.language = "fr"
        
        let article2 = manager.newArticle()
        article2.title = "Article 1 - en"
        article2.content = "contenu 2 - en"
        article2.date_update = NSDate()
        article2.date_create = NSDate()
        article2.language = "en"*/
        
        
        
        for test in manager.getAllArticles()
        {
            print(test.description)
        }
        print("-------------")
        for test in manager.getAllArticles(withLang: "fr")
        {
            print(test.description)
        }
        print("-------------")
        for test in manager.getAllArticles(withLang: "en")
        {
            print(test.description)
        }
        print("-------------")
        for test in manager.getAllArticles(containString: "2")
        {
            print(test.description)
        }
        print("-------------")
        for test in manager.getAllArticles(containString: "1")
        {
            print(test.description)
        }
        print("-------------")
        for test in manager.getAllArticles(containString: "42")
        {
            print(test.description)
        }
        print("-------------")
        for article in manager.getAllArticles(withLang: "en")
        {
            manager.removeArticle(article: article)
        }
        for test in manager.getAllArticles()
        {
            print(test.description)
        }
        
        //manager.save()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

}

