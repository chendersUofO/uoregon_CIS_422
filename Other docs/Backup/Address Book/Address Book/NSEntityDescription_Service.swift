//
//  NSEntityDescription_Service.swift
//  Address Book
//
//  Created by Caleb Friden on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import CoreData
import Foundation


public extension NSEntityDescription {
    public class func insertNewObjectForNamedEntity<T:NSManagedObject where T:NamedEntity>(namedEntity: T.Type, inManagedObjectContext context: NSManagedObjectContext) -> T {
        return self.insertNewObjectForEntityForName(namedEntity.entityName, inManagedObjectContext: context) as! T
    }
}