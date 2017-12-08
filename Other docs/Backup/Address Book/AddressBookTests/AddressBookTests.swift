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
        if let addressBooksController = AddressBookService.sharedAddressBookService.books() {
            XCTAssert(addressBooksController.count > 0, "Less than one Book in books")
        }
    }
    
    func testContacts() {
        if let addressContactsController = AddressBookService.sharedAddressBookService.contacts() {
            XCTAssert(addressContactsController.count > 0, "Less than one Contact in contacts")
        }
    }
    
    func testContactsForSearchByName() {
        let contact: AddressBook.Contact
        if let contactsController = AddressBookService.sharedAddressBookService.contactsForSearchByName("John Doe") {
            contact = contactsController[0]
            XCTAssert(contact.name == "John Doe", "Contacts for search by name not fetching properly or less than one Contact in Book")
        }
    }
    
    func testBooksForSearchByName() {
        let book: AddressBook.Book
        if let booksController = AddressBookService.sharedAddressBookService.booksForSearchByName("Address Book 1") {
            book = booksController[0]
            XCTAssert(book.title == "Address Book 1", "Books for search by name not fetching properly or less than one Book")
        }
    }
    
    func testContactsForSearchByNameForBook() {
        let contact: AddressBook.Contact
        let book: AddressBook.Book
        if let addressBooksController = AddressBookService.sharedAddressBookService.books() {
            book = addressBooksController[0]
            if let contactsController = AddressBookService.sharedAddressBookService.contactsForSearchByNameForBook("John Doe", book: book) {
                contact = contactsController[0]
                XCTAssert(contact.name == "John Doe", "Contacts for book not fetching properly or less than one Contact in Book")
            }
        }
    }
    
    func testContactsForBook() {
        let book: AddressBook.Book
        if let addressBooksController = AddressBookService.sharedAddressBookService.books() {
            book = addressBooksController[0]
            if let contactsController = AddressBookService.sharedAddressBookService.contactsForBook(book) {
                XCTAssert(contactsController.count > 0, "Less than one Contact in Book")
            }
        }
    }
    
    func testCreateContactForBookWithOnlyRequiredArgs() {
        let book: AddressBook.Book
        let contact: AddressBook.Contact
        if let addressBooksController = AddressBookService.sharedAddressBookService.books() {
            book = addressBooksController[0]
            AddressBookService.sharedAddressBookService.createContactForBook("Jane Doe", book: book)
            if let contactsController = AddressBookService.sharedAddressBookService.contactsForSearchByNameForBook("Jane Doe", book: book) {
                contact = contactsController[1]
                XCTAssert(contact.name == "Jane Doe", "Contact for book with only required args not adding contact properly")
            }
        }
    }
    
    func testCreateContactForBookWithAllArgs() {
        let book: AddressBook.Book
        let contact: AddressBook.Contact
        if let addressBooksController = AddressBookService.sharedAddressBookService.books() {
            book = addressBooksController[0]
            AddressBookService.sharedAddressBookService.createContactForBook("Jane Doe",
                book: book,
                address1: "1800 Hollywood Blvd",
                address2: "123 Park Ave",
                city: "Hollywood",
                state: "CA",
                zip: "987654",
                cellNumber: "18005554545",
                workNumber: "18009876543",
                homeNumber: "18001234567",
                photo: "path/to/photo.png",
                company: "University of Oregon",
                email: "jdoe@email.com")
            if let contactsController = AddressBookService.sharedAddressBookService.contactsForSearchByNameForBook("Jane Doe", book: book) {
                contact = contactsController[0]
                XCTAssert(
                    contact.name == "Jane Doe" &&
                    contact.email == "jdoe@email.com" &&
                    contact.cell_number == "18005554545" &&
                    contact.home_number == "18001234567" &&
                    contact.company == "University of Oregon" &&
                    contact.work_number == "18009876543" &&
                    contact.street_address_line1 == "1800 Hollywood Blvd" &&
                    contact.street_address_line2 == "123 Park Ave" &&
                    contact.city == "Hollywood" &&
                    contact.zip_code == "987654" &&
                    contact.photo == "path/to/photo.png" &&
                    contact.state == "CA",
                    ("Contact for book with all args not adding contact properly, below were attribute values found in test: \n name: " + contact.name! + "\n email: " + contact.email! + "\n cell_number: " + contact.cell_number! + "\n home_number: " + contact.home_number! + "\n work_number: " + contact.work_number! + "\n company: " + contact.company! + "\n address1: " + contact.street_address_line1! + "\n address2: " + contact.street_address_line2! + "\n city: " + contact.city! + "\n zip: " + contact.zip_code! + "\n photo: " + contact.photo! + "\n state: " + contact.state!))
            }
        }
    }
}
