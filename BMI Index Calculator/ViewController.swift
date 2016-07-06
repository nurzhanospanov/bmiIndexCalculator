//
//  ViewController.swift
//  BMI Index Calculator
//
//  Created by nurzhan on 7/6/16.
//  Copyright © 2016 Nurzhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightField: UITextField!
    
    
    
    @IBOutlet weak var bmiIndexField: UITextView!
    
    @IBOutlet weak var categoryField: UITextView!
   
    @IBOutlet weak var heightField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateButtonPressed(sender: AnyObject) {
        
        guard let weightFieldEntered = Double(weightField.text!) else {
        
            if weightField.text == "" {
                
                    let alert = UIAlertController(title: "Type in error", message: "Please type in your data.", preferredStyle: .Alert)
                    
                    presentViewController(alert, animated: true, completion:nil)
            }
                bmiIndexField.text = ""
                return
        }
        
        
        guard let heightFieldEntered = Double(heightField.text!) else {
            
            if heightField.text == "" {
            
            let alert = UIAlertController(title: "Type in error", message: "Please type in your data.", preferredStyle: .Alert)
            
            presentViewController(alert, animated: true, completion:nil)
            }

            
            weightField.text = ""

            bmiIndexField.text = ""
            return
        }
        

        let heightPreparedForCalculation = (heightFieldEntered/100) * (heightFieldEntered/100)
        
        let bmiIndexResult = weightFieldEntered / heightPreparedForCalculation
        
        
        bmiIndexField.text = String(format: "%.2f", bmiIndexResult)
    
        if bmiIndexResult < 15 {
            
            categoryField.text = "Very severely underweight" }
                else if bmiIndexResult <= 16  {
                    categoryField.text = "Severly Underweight"
            }
                else if bmiIndexResult <= 18.5  {
                    categoryField.text = "Underweight"
            }
                else if bmiIndexResult <= 25  {
                    categoryField.text = "Normal healthy weight"
            }
                else if bmiIndexResult <= 30  {
                    categoryField.text = "Overweight"
            }
                else if bmiIndexResult <= 35  {
                    categoryField.text = "Moderately obese"
            }
                else if bmiIndexResult <= 40  {
                    categoryField.text = "Severely obese"
            }
                else if bmiIndexResult > 40  {
                    categoryField.text = "Very severely obese"
        }
        
            imageView.image = UIImage(named: ("image.png"))
            
        }
        
    }





