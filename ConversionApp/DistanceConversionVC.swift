//
//  DistanceConversionVC.swift
//  ConversionApp
//
///  Created by Pravin Kandala, Kamal Dandamudi on 10/12/15.
//  Copyright (c) 2015  All rights reserved.
//

import UIKit

class DistanceConversionVC: UIViewController {
    //Constants for conversion factors
    let milesToKil = 1.60934
    let kilTomiles = 0.621371
    
    // Referencing Outlets for different UI components
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var changingFromLabel: UILabel!
    @IBOutlet weak var changingToLabel: UILabel!
    @IBOutlet weak var changingTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
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
    func convertDistanceFrom(value:Double, usingFactor:Double) -> String{
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
            if segmentedControl.selectedSegmentIndex==0{
                //Calling convertMassFrom function based on the segment currently selected.
                changedLabel.text = convertDistanceFrom(number, usingFactor: milesToKil)
            }
            else{
                changedLabel.text = convertDistanceFrom(number, usingFactor: kilTomiles)
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
            changingFromLabel.text = "Distance in Miles"
            changingToLabel.text = "Distance in Kilometers"
        }
        else{
            changingFromLabel.text = "Distance in Kilometers"
            changingToLabel.text = "Distance in Miles"
        }
        
    }

}
