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

    override public var description: String{
        return ("\(self.title)")
    }
}
