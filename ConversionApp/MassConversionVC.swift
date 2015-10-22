//
//  FirstViewController.swift
//  ConversionApp
//
//  Created by Pravin Kandala, Kamal Dandamudi on 10/12/15.
//  Copyright (c) 2015  All rights reserved.
//

import UIKit

class MassConversionVC: UIViewController {
    //Constants for conversion factors
    let poundToKilogram = 0.453592
    let kilogramToPound = 2.20462
    
    // Referencing Outlets for different UI components
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var changingFromLabel: UILabel!
    @IBOutlet weak var changingToLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var changingTextField: UITextField!
    @IBOutlet weak var changedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Funtion for Button to reset values in Text Fields
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
    
    //On click of Return button on keyboard, keyboard is resigned and the value is converted
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        convertPressed(convertButton)
        return true
        
    }
    
    // On click of anywhere in the view keyboard is resigned
    @IBAction func viewClicked(sender: AnyObject) {
        view.endEditing(true)
    }
    
    //Function for Button that triggers conversion
    @IBAction func convertPressed(sender: AnyObject) {
        //Number formatter for decimal style
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        //Using toDouble function from StringEx.swift
        if let number=changingTextField.text.toDouble() {
            if segmentedControl.selectedSegmentIndex==1{
                //Calling convertMassFrom function based on the segment currently selected.
                changedLabel.text = convertMassFrom(number, usingFactor: kilogramToPound)
            }
            else{
                changedLabel.text = convertMassFrom(number, usingFactor: poundToKilogram)
            }
        }
        //If anything other than decimal numbers are entered an alert view is displayed.
        else {
            let alert = UIAlertView(title: "Error", message: "Please enter a number", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            //changingTextField.text="0"
            //changedLabel.text="0"
        }
    }
    
    //Function to swap text fields' text on changing the segemented control
    @IBAction func segmentControlChanged(sender: UISegmentedControl) {
        changedLabel.text="0"
        changingTextField.text=""
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

