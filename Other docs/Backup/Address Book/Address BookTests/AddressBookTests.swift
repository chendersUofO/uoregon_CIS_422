//
//  Address_BookTests.swift
//  Address BookTests
//
//  Created by Advancement IT Student on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import XCTest
@testable import AddressBook

class AddressBookTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCoreDataServiceMainQueueContextExists() {
        let addressBookService = AddressBookService.sharedAddressBookService
        XCTAssertNotNil(addressBookService, "AddressBook singleton should not be nil")
    }
    
    func testBooks() {
        let addressBooksController = AddressBooksService.sharedAddressBookService.books()
        try! addressBooksController.performFetch()
        let book = addressBooksController.objectAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as AddressBook.Book
    }
    
    func testContactsForBook() {
        let addressBooksController = AddressBookService.sharedAddressBookService.books()
        try! addressBooksController.performFetch()
        let book = addressBooksController.objectAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) as AddressBook.Book
        
        let contactsController = AddressBookService.sharedAddressBookService.contactsForBook(book)
        try! contactsController.performFetch()
        var sectionObjectsNotZero = true
        
        if let sections = contactsController.sections {
            for sect in sections {
                if sect.numberOfObjects <= 0 {
                    sectionObjectsNotZero = false
                }
            }
        }
        XCTAssert(contactsController.sections?.count > 0 && sectionObjectsNotZero, "Less than one section in books or a section has less than one object")
    }
}
