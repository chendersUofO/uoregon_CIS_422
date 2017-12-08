//
//  vcMainScreen.swift
//  AddressBook
//
//  Created by jstuemke on 1/20/16.
//  Copyright © 2016 CIS422 Team Dead Beef. All rights reserved.
//

import Cocoa

class vcMainScreen: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    var abs = AddressBookService.sharedAddressBookService
    
    var book = [Contact.self]
    
    
    @IBOutlet var addressTable: NSTableView!
}

extension vcMainScreen: NSTableViewDataSource, NSTableViewDelegate{
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        //        print((abs.books()?.count)!)
        //        print("Working")
        return (abs.books()?.count)!
        
    }
    @IBAction func RefreshButton(sender: NSButton) {
        addressTable.reloadData()
    }
    @IBAction func EditButton(sender: NSButton) {
        let edit = vcEditScreen()
        let indexSet = NSIndexSet(index: addressTable.selectedRow)
        addressTable.removeRowsAtIndexes(indexSet, withAnimation: NSTableViewAnimationOptions.EffectFade)
        
        abs.createContactForBook(
            edit.First.stringValue,
            book: abs.books()![0],
            address1: edit.Address1.stringValue,
            address2: edit.Address2.stringValue,
            city: edit.City.stringValue,
            state: edit.State.stringValue,
            zip: edit.Zip.stringValue,
            cellNumber: edit.Phone.stringValue)
    }
    @IBAction func DeleteButton(sender: NSButton){
        let indexSet = NSIndexSet(index: addressTable.selectedRow)
        addressTable.removeRowsAtIndexes(indexSet, withAnimation: NSTableViewAnimationOptions.EffectFade)
        abs.deleteContact(addressTable.selectedRow)
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView: NSTableCellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: self) as! NSTableCellView
        
        cellView.textField!.stringValue = "Testing"
        
        switch tableColumn?.identifier {
        case "First"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("name")) as! String  //"First" 
        case "Last"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("name")) as! String  //"Last"
        case "Address"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("street_address_line1")) as! String  //"Address"
        case "City"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("city")) as! String  //"City"
        case "State"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("state")) as! String  //"State"
        case "Zip"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("zip_code")) as! String  //"Zip"
        case "Phone"?:
            cellView.textField!.stringValue = (abs.contacts()?[row].valueForKey("cell_number")) as! String //"Phone"
        default:
            cellView.textField!.stringValue = "Error"
        }
        //        if tableColumn!.identifier == "First"{
        //            let name = "TestingName"
        //            cellView.textField!.stringValue = name
        //            return cellView
        //        }
        return cellView
        
    }
    
}