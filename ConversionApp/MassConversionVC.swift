//
//  FirstViewController.swift
//  ConversionApp
//
//  Created by Navya Rayala on 10/6/15.
//  Copyright (c) 2015 Kamal Dandamudi. All rights reserved.
//

import UIKit

class MassConversionVC: UIViewController {
    
    let poundToKilogram = 0.453592
    let kilogramToPound = 2.20462
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var changingFromLabel: UILabel!
    @IBOutlet weak var changingToLabel: UILabel!
    
    @IBOutlet weak var changingTextField: UITextField!
    
    @IBOutlet weak var changedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clearPressed(sender: AnyObject) {
        changingTextField.text=""
        changedLabel.text="0"
    }
    
    //Function to convert number based on the factor passed. (DecimalStyle)
    func convertMassFrom(value:Double, usingFactor:Double) -> String{
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        return numberFormatter.stringFromNumber(value * usingFactor)!
    }
    
    
    @IBAction func convertPressed(sender: AnyObject) {
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        if let number=changingTextField.text.toDouble() {
            if segmentedControl.selectedSegmentIndex==1{
                changedLabel.text = convertMassFrom(number, usingFactor: kilogramToPound)
            }
            else{
                changedLabel.text = convertMassFrom(number, usingFactor: poundToKilogram)
            }
        }
        else {
            let alert = UIAlertView(title: "Error", message: "Please enter a number", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            //changingTextField.text="0"
            //changedLabel.text="0"
        }
    }
    @IBAction func segmentControlChanged(sender: UISegmentedControl) {
        changedLabel.text="0"
        if sender.selectedSegmentIndex == 0{
            changingFromLabel.text = "Mass in Pounds"
            changingToLabel.text = "Mass in Kilograms"
        }
        else{
            changingFromLabel.text = "Mass in Kilograms"
            changingToLabel.text = "Mass in Pounds"
        }
        
    }
}

