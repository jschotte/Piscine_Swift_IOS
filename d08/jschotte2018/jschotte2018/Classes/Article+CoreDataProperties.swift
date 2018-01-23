//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Jeremy SCHOTTE on 1/19/18.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: NSData?
    @NSManaged public var date_create: NSDate?
    @NSManaged public var date_update: NSDate?

}
