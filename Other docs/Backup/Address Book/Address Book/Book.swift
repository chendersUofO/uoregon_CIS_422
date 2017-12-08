//
//  Book.swift
//  Address Book
//
//  Created by Advancement IT Student on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Foundation
import CoreData
import CoreDataService


class Book: NSManagedObject, NamedEntity {
    
    static var entityName: String {
        return "Book"
    }

}
