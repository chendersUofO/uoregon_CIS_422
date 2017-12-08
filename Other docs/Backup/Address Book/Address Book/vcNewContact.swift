//
//  ViewController.swift
//  Address Book
//
//  Created by Advancement IT Student on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Cocoa
import CoreData

class vcNewContact: NSViewController {
    
    @IBOutlet var First: NSTextField!
    @IBOutlet var Last: NSTextField!
    @IBOutlet var Address1: NSTextField!
    @IBOutlet var Address2: NSTextField!
    @IBOutlet var City: NSTextField!
    @IBOutlet var State: NSTextField!
    @IBOutlet var Zip: NSTextField!
    @IBOutlet var Phone: NSTextField!
    var abs = AddressBookService.sharedAddressBookService
    var book: Book? = nil
    
    @IBAction func SaveNewContact(sender: NSButton) {
        if(book == nil){
            abs.createBook("default")
            book = abs.booksForSearchByName("default")![0]
        }
        abs.createContactForBook(
            First.stringValue,
            book: book!,
            address1: Address1.stringValue,
            address2: Address2.stringValue,
            city: City.stringValue,
            state: State.stringValue,
            zip: Zip.stringValue,
            cellNumber: Phone.stringValue
        )
        
        self.view.window?.close()
    }

    @IBAction func CancelNewContact(sender: NSButton) {
        self.view.window?.close()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        First.editable = true
        Last.editable = true
        Address1.editable = true
        Address2.editable = true
        City.editable = true
        State.editable = true
        Zip.editable = true
        Phone.editable = true
        abs.createBook("default")
        book = abs.booksForSearchByName("default")![0] // this will need to be changed/removed later when we add functionality for >1 book.
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

