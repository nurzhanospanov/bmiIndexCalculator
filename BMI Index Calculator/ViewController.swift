//
//  ViewController.swift
//  BMI Index Calculator
//
//  Created by nurzhan on 7/6/16.
//  Copyright © 2016 Nurzhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBOutlet weak var heightTextField: UITextField!
    
    
    @IBOutlet weak var bmiIndexLabel: UILabel!
    
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bmiIndexLabel.text = ""
        self.categoryLabel.text = ""
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //@IBAction func calculateButtonPressed(sender: AnyObject) {
    
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    @IBAction func calculateButtonPressed(sender: AnyObject) {
        
        guard let weightFieldEntered = Double(weightTextField.text!) else {
            
            if weightTextField.text == "" {
                
                // no user input alert
                let alert = UIAlertController(title: "Blank fields", message: "Please type in your data.", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                
                
                presentViewController(alert, animated: true, completion:nil)
            }
            bmiIndexLabel.text = ""
            
            return
        }
        
        
        guard let heightFieldEntered = Double(heightTextField.text!) else {
            
            if heightTextField.text == "" {
                
                
                // no user input alert
                
                let alert = UIAlertController(title: "Blank fields", message: "Please type in your data.", preferredStyle: .Alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil))
                
                presentViewController(alert, animated: true, completion:nil)
                
            }
            
            weightTextField.text = ""
            
            bmiIndexLabel.text = ""
            
            return
        }
        
        
        let heightPreparedForCalculation = (heightFieldEntered/100) * (heightFieldEntered/100)
        
        let bmiIndexResult = weightFieldEntered / heightPreparedForCalculation
        
        
        bmiIndexLabel.text = String(format: "%.2f", bmiIndexResult)
        
        
        if bmiIndexResult < 15 {
            
            categoryLabel.text = "Very severely underweight" }
            
        else if bmiIndexResult <= 18.5  {
            categoryLabel.text = "Underweight"
            self.bmiIndexLabel.textColor = UIColor.init(red: 139.0/255, green: 228.0/255, blue: 246.0/255, alpha: 1.0)
            
        }
        else if bmiIndexResult <= 25  {
            categoryLabel.text = "Healthy weight"
            self.bmiIndexLabel.textColor = UIColor.init(red: 167.0/255, green: 213.0/255, blue: 138.0/255, alpha: 1.0)
            
        }
        else if bmiIndexResult <= 30  {
            categoryLabel.text = "Overweight"
            self.bmiIndexLabel.textColor = UIColor.init(red: 255.0/255, green: 220.0/255, blue: 99.0/255, alpha: 1.0)
            
        }
        else if bmiIndexResult > 30  {
            categoryLabel.text = "Obese"
            self.bmiIndexLabel.textColor = UIColor.init(red: 251.0/255, green: 114.0/255, blue: 93.0/255, alpha: 1.0)
            
        }
        
    }
    
}





