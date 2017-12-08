//
//  Book+CoreDataProperties.swift
//  Address Book
//
//  Created by Advancement IT Student on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var title: String?
    @NSManaged var contacts: NSSet?
    
    func addContactObjectToBook(contact: Contact) {
        let items = self.mutableSetValueForKey("contacts");
        items.addObject(contact)
    }

}
