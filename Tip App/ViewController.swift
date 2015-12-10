//
//  ViewController.swift
//  Tips
//
//  Created by Labuser on 12/9/15.
//  Copyright (c) 2015 wustl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var totalField: UITextField!
    @IBOutlet var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        tipControl.selectedSegmentIndex = 3
        let defaults = NSUserDefaults.standardUserDefaults()
        let stringValue = defaults.doubleForKey("defaultTip")
        tipControl.setTitle("\(stringValue)%",forSegmentAtIndex: 3)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func update(){
        let defaults = NSUserDefaults.standardUserDefaults()
        let stringValue = defaults.doubleForKey("defaultTip")
        var TipPercentages = [0.18, 0.2, 0.22, stringValue/100]
        tipControl.setTitle("\(stringValue)%",forSegmentAtIndex: 3)
        var tipPercentage = TipPercentages[tipControl.selectedSegmentIndex]
        var billAmount = NSString(string: totalField.text!).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        update()
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        update()
    }
    

}

