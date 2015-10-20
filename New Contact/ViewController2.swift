//
//  ViewController2.swift
//  New Contact
//
//  Created by sherriff on 10/18/15.
//  Copyright © 2015 Mark Sherriff. All rights reserved.
//

import UIKit
import Contacts

class ViewController2: UIViewController {
    
    var nameToDisplay = "None"
    // MARK: Properties
    
    @IBOutlet weak var nameField: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewWillAppear(animated: Bool) {
        print("VC2: I am now appearing")
    }
    
    override func viewWillDisappear(animated: Bool) {
        print("VC2: I am now disappearing")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("VC2: I have appeared!!!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        print("VC2: I am ghost....")
    }

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.text = nameToDisplay
        print("nameToDisplay: " + nameToDisplay)
    }
    
    @IBAction func datePickerChanged(sender: UIDatePicker) {
        print(datePicker.date)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Actions

    @IBAction func shareButton(sender: UIButton) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        
        let string = dateFormatter.stringFromDate(datePicker.date)
        
        let activityViewController = UIActivityViewController(activityItems: [string as NSString], applicationActivities: nil)
        
        presentViewController(activityViewController, animated: true, completion :{})
        
    }

}