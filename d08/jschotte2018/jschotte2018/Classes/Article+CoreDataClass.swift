//
//  Article+CoreDataClass.swift
//  
//
//  Created by Jeremy SCHOTTE on 1/19/18.
//
//

import Foundation
import CoreData


public class Article: NSManagedObject {

    override public var description : String
    {
        return ("\(String(describing: self.title)),\(String(describing: self.content)),\(String(describing: self.language)),\(String(describing: self.date_create)),\(String(describing: self.date_update))")
    }
}
