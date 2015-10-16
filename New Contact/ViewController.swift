//
//  ViewController.swift
//  New Contact
//
//  Created by sherriff on 10/15/15.
//  Copyright © 2015 Mark Sherriff. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController {
    
    // MARK: Properties

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions

    @IBAction func addContactAction(sender: UIButton) {
        // Creating a mutable object to add to the contact
        let contact = CNMutableContact()
        
        // contact.imageData = NSData() // The profile picture as a NSData object
        
        contact.givenName = nameField.text!
        contact.familyName = lastField.text!
        
        let homeEmail = CNLabeledValue(label:CNLabelHome, value:emailField.text!)
        let workEmail = CNLabeledValue(label:CNLabelWork, value:"workEmail@work.com")
        contact.emailAddresses = [homeEmail, workEmail]
        
        contact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:phoneField.text!))]
        
//        let homeAddress = CNMutablePostalAddress()
//        homeAddress.street = "1 Infinite Loop"
//        homeAddress.city = "Cupertino"
//        homeAddress.state = "CA"
//        homeAddress.postalCode = "95014"
//        contact.postalAddresses = [CNLabeledValue(label:CNLabelHome, value:homeAddress)]
//        
//        let birthday = NSDateComponents()
//        birthday.day = 1
//        birthday.month = 4
//        birthday.year = 1988  // You can omit the year value for a yearless birthday
//        contact.birthday = birthday
        
        // Saving the newly created contact
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.addContact(contact, toContainerWithIdentifier:nil)
        try! store.executeSaveRequest(saveRequest)
        
        

    }

}

