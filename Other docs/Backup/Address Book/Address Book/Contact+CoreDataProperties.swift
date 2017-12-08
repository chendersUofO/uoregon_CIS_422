//
//  Contact+CoreDataProperties.swift
//  AddressBook
//
//  Created by Caleb Friden on 1/19/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var cell_number: String?
    @NSManaged var city: String?
    @NSManaged var company: String?
    @NSManaged var email: String?
    @NSManaged var home_number: String?
    @NSManaged var name: String?
    @NSManaged var photo: String?
    @NSManaged var state: String?
    @NSManaged var street_address_line1: String?
    @NSManaged var street_address_line2: String?
    @NSManaged var work_number: String?
    @NSManaged var zip_code: String?
    @NSManaged var book: Book?

}
