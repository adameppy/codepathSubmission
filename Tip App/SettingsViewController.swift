//
//  SettingsViewController.swift
//  Tips
//
//  Created by Labuser on 12/9/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var defaultText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let stringValue = defaults.objectForKey("defaultTip") as? String{
        
        defaultText.text = stringValue
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func valueChange(sender: AnyObject) {
        print("changed value")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string: defaultText.text!).doubleValue, forKey: "defaultTip")

        defaults.synchronize()
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
