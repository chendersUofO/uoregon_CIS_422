//
//  EditScreen.swift
//  AddressBook
//
//  Created by Casey Chesshir on 1/19/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Cocoa
import CoreData

class vcEditScreen: NSViewController {
    
    @IBOutlet var First: NSTextField!
    @IBOutlet var Last: NSTextField!
    @IBOutlet var Address1: NSTextField!
    @IBOutlet var Address2: NSTextField!
    @IBOutlet var City: NSTextField!
    @IBOutlet var State: NSTextField!
    @IBOutlet var Zip: NSTextField!
    @IBOutlet var Phone: NSTextField!

    
    var abs = AddressBookService.sharedAddressBookService
    var tempbook: Book? = nil

    @IBAction func CancelButton(sender: NSButton) {
        self.view.window?.close()
    }
    
    @IBAction func DoneButton(sender: NSButton) {
        if (tempbook == nil){
            abs.createBook("temp")
            tempbook = abs.booksForSearchByName("temp")![0]
        }
        abs.createContactForBook(
            First.stringValue,
            book: tempbook!,
            address1: Address1.stringValue,
            address2: Address2.stringValue,
            city: City.stringValue,
            state: State.stringValue,
            zip: Zip.stringValue,
            cellNumber: Phone.stringValue
        )
        self.view.window?.close()
    }
}