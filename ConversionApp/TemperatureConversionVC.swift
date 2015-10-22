//
//  SecondViewController.swift
//  ConversionApp
//
//  Created by Pravin Kandala, Kamal Dandamudi on 10/12/15.
//  Copyright (c) 2015  All rights reserved.
//

import UIKit

class TemperatureConversionVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    //Variable declarations
    var newTemperature = 0.0
    var values:[Int] = []
    var endStr = "°F"
    var endLabelStr = "°C"
    var numberFormatter = NSNumberFormatter()
    
    // Referencing Outlets for different UI components
    @IBOutlet weak var segmentedControl2: UISegmentedControl!
    @IBOutlet weak var pickerTemperature: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Loading initial values into picker.
        segmentedControlChanged2(segmentedControl2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentedControlChanged2(sender: AnyObject) {
        //For conversion from Farenheit to Celsius
        if sender.selectedSegmentIndex == 0{
            // Creating array of values from -129 to 134
            values = Array(-129...134)
            endStr="°F"
            endLabelStr="°C"
            //reloadAllComponents to reload data and numberOfRows for Picker
            pickerTemperature.reloadAllComponents()
            numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
            //Calling function to convert temperature based on selectedSegment
            newTemperature = convertTemp(values[pickerTemperature.selectedRowInComponent(0)], boolInFaren: true)
            outLabel.text=(numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
        }
        //For conversion from Celsius to Farenheit
        else if sender.selectedSegmentIndex == 1
        {
            // Creating array of values from -90 to 57
            values = Array(-90...57)
            endStr="°C"
            endLabelStr="°F"
            //pickerTemperature.reloadInputViews()
            //reloadAllComponents to reload data and numberOfRows for Picker
            pickerTemperature.reloadAllComponents()
            numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
            //Calling function to convert temperature based on selectedSegment
            newTemperature = convertTemp(values[pickerTemperature.selectedRowInComponent(0)], boolInFaren: false)
            outLabel.text=(numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
            
        }
        
    }
    
    //Delegate function to define number of components in picker
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //Delegate function to define numberOfRowsInComponent in picker
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return values.count
    }
//    //Delegate function to title for each row
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return values[row].description
//    }
    //Delegate function that specifies what to do when a row is selected
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        var temperature = values[row]
        var boolInFaren = true
        
        if(segmentedControl2.selectedSegmentIndex==0){
            boolInFaren = true
        }
        else{
            boolInFaren = false
        }
        newTemperature=convertTemp(temperature, boolInFaren: boolInFaren)
        
        outLabel.text = (numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
        
    }
    //Delegate function to set attributeTitle for Row to display °C of °F at the end
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var mutString = values[row].description+endStr
        return NSMutableAttributedString(string: mutString)
    }
    
    //Function to convert temperatures from C to F or F to C based on boolean value passed.
    func convertTemp(temperature:Int, boolInFaren:Bool)->Double{
        if(boolInFaren){
            return (Double(temperature)-32.0)/1.8
        }
        else
        {
            return Double(temperature)*1.8 + 32
        }
        
    }
    
    
}

