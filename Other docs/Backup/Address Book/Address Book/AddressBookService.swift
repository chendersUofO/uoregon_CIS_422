//
//  AddressBookService.swift
//  Address Book
//
//  Created by Caleb Friden on 1/14/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Cocoa
import CoreData
import CoreDataService
import Foundation

class AddressBookService {
    // MARK: Service
    
    // Use: Creates and adds a new contact to a given address book
    // Required Arguments: Contact's name and a book to add the contact to
    // Optional Arguments: Cell, work, and home phone numbers, email, address, path to a photo file, and company name.
    // Returns: Does not return anything.
    func createContactForBook(
        name: String,
        book: Book,
        address1: String = "",
        address2: String = "",
        city: String = "",
        state: String = "",
        zip: String = "",
        cellNumber: String = "",
        workNumber: String = "",
        homeNumber: String = "",
        photo: String = "",
        company: String = "",
        email: String = ""
        ) {
            let context = CoreDataService.sharedCoreDataService.mainQueueContext
            let contact = NSEntityDescription.insertNewObjectForNamedEntity(Contact.self, inManagedObjectContext: context)
            contact.name = name
            contact.street_address_line1 = address1
            contact.street_address_line2 = address2
            contact.city = city
            contact.state = state
            contact.zip_code = zip
            contact.cell_number = cellNumber
            contact.work_number = workNumber
            contact.home_number = homeNumber
            contact.photo = photo
            contact.company = company
            contact.email = email
            
            book.addContactObjectToBook(contact)
            
            try! context.save()
            CoreDataService.sharedCoreDataService.saveRootContext {
                print("Successfully saved Contact data")
            }
    }
    
    // Use: Deletes a contact in the address book
    // Arguments: 
    // Returns: Does not return anything.
    
    func deleteContact(index: Int){
        let fetchRequest = NSFetchRequest(namedEntity: Contact.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        
    }
    
    // Use: Creates and stores a new address book
    // Arguments: A title for the address book
    // Returns: Does not return anything.
    func createBook(title: String) {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        let book = NSEntityDescription.insertNewObjectForNamedEntity(Book.self, inManagedObjectContext: context)
        book.title = title
        
        try! context.save()
        CoreDataService.sharedCoreDataService.saveRootContext {
           print("Successfully saved Book data")
        }
    }
    
    // Use: Fetches all contacts
    // Arguments: None
    // Returns: Array of NSManagedObjects containing all contacts
    func contacts() -> [Contact]? {
        let fetchRequest = NSFetchRequest(namedEntity: Contact.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Contact]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // Use: Fetches all Address Books
    // Arguments: None
    // Returns: Array of Books containing all address books
    func books() -> [Book]? {
        let fetchRequest = NSFetchRequest(namedEntity: Book.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Book]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // Use: Fetches all contacts where a given string appears in the contact's name
    // Arguments: String to search contacts name for
    // Returns: Array of Contacts containing all contacts where string matches contact names
    func contactsForSearchByName(searchText: String) -> [Contact]? {
        let fetchRequest = NSFetchRequest(namedEntity: Contact.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", searchText)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Contact]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // Use: Fetches all Books where a given string appears in the contact's name, in a given book
    // Arguments: String to search book's title for
    // Returns: Array of Books containing all Books where string matches Book title
    func booksForSearchByName(searchText: String) -> [Book]? {
        let fetchRequest = NSFetchRequest(namedEntity: Book.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "title contains[cd] %@", searchText)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Book]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // Use: Fetches all contacts where a given string appears in the contact's name, in a given book
    // Arguments: String to search contacts name for, and a book to limit the search to
    // Returns: Array of Contacts containing all contacts where string matches contact names in a given book
    func contactsForSearchByNameForBook(searchText: String, book: Book) -> [Contact]? {
        let fetchRequest = NSFetchRequest(namedEntity: Contact.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@ && book == %@", searchText, book)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Contact]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // Use: Fetches all contacts
    // Arguments: None
    // Returns: Array of Contacts containing all contacts in a given book
    func contactsForBook(book: Book) -> [Contact]? {
        let fetchRequest = NSFetchRequest(namedEntity: Contact.self)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        fetchRequest.predicate = NSPredicate(format: "book == %@", book)
        
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        do{
            let results = try context.executeFetchRequest(fetchRequest) as! [Contact]
            return results
        }
        catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        return nil
    }
    
    // MARK: Initialization
    private init() {
        let context = CoreDataService.sharedCoreDataService.mainQueueContext
        context.performBlockAndWait {
            let fetchRequest = NSFetchRequest(namedEntity: Book.self)
            if context.countForFetchRequest(fetchRequest, error: nil) == 0 {
                let book = NSEntityDescription.insertNewObjectForNamedEntity(Book.self, inManagedObjectContext: context)
                book.title = "Address Book 1"
                self.createContactForBook("John Doe",book: book,address1: "1585 E 13th Ave",address2: "",city: "Eugene",state: "Oregon",zip: "97403", cellNumber: "5415550000")
            }
            try! context.save()
            CoreDataService.sharedCoreDataService.saveRootContext {
                print("Successfully initiallized CoreData")
            }
        }
    }
                
    
    // MARK: Properties (Static)
    static let sharedAddressBookService = AddressBookService()
}