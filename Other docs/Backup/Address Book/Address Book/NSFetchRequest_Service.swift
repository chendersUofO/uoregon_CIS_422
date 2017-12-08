//
//  NSFetchRequest_Service.swift
//  Address Book
//
//  Created by Caleb Friden on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import CoreData
import Foundation


public extension NSFetchRequest {
    public convenience init<T:NSManagedObject where T:NamedEntity>(namedEntity: T.Type) {
        self.init(entityName: namedEntity.entityName)
    }
}