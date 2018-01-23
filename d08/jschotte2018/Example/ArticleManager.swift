//
//  ArticleManager.swift
//  jschotte2018_Example
//
//  Created by Jeremy SCHOTTE on 1/19/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import CoreData
import jschotte2018

class ArticleManager: NSObject
{
    var managedObjectContext : NSManagedObjectContext?
    
    init(completionClosure: @escaping () -> ()) {
        
        let bundle = Bundle(for: Article.self)
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = bundle.url(forResource: "article", withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext?.persistentStoreCoordinator = psc
        

            guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
                fatalError("Unable to resolve document directory")
            }
            let storeURL = docURL.appendingPathComponent("article.sqlite")
            do {
                try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
                
            } catch {
                fatalError("Error migrating store: \(error)")
            }
        
    }
    
    func newArticle() -> Article
    {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: self.managedObjectContext!) as! Article

    }
    
    func save()
    {
        do{
            try managedObjectContext?.save()
        }
        catch{
        
        }
    }
    
    func getAllArticles() -> [Article]
    {
        var articles  = [Article]()
        do{
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
            try articles = self.managedObjectContext?.fetch(fetchRequest) as! [Article]
        }
        catch{
            
        }
        return articles
    }
    
    func getAllArticles(withLang lang : String) -> [Article]
    {
        var articles  = [Article]()
        
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
            fetchRequest.predicate = NSPredicate(format: "language == %@", lang)
        do{
            try articles = self.managedObjectContext?.fetch(fetchRequest) as! [Article]
        }
        catch{
            
        }
        return articles
    }
    
    func getAllArticles(containString str : String) -> [Article]
    {
        var articles  = [Article]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        fetchRequest.predicate = NSPredicate(format: "content CONTAINS[cd] %@", str)
        do{
            try articles = self.managedObjectContext?.fetch(fetchRequest) as! [Article]
        }
        catch{
            
        }
        return articles
    }
    
    func removeArticle(article : Article)
    {
        self.managedObjectContext?.delete(article)
    }
    

    
}
