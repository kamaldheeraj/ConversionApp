//
//  SecondViewController.swift
//  ConversionApp
//
//  Created by Pravin Kandala, Kamal Dandamudi on 10/12/15.
//  Copyright (c) 2015  All rights reserved.
//

import UIKit

class TemperatureConversionVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate  {
    
    
    //var values = [Int]()
    var part = 0
    var index = 0
    var newTemperature = 0.0
    var values = (-129...134).map {$0}
    var endStr = "°F"
    var endLabelStr = "°C"
    
    var numberFormatter = NSNumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //var numberFormatter = NSNumberFormatter()
        
//        numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
//        newTemperature = convertTemp(values[pickerTemperature.selectedRowInComponent(0)], boolInFaren: true)
//        outLabel.text=(numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
        
        
        
        segmentedControlChanged2(segmentedControl2)
            }
//    override func supportedInterfaceOrientations() -> Int {
//        return Int(UIInterfaceOrientationMask.All.rawValue)
//    }
//    
//    override func shouldAutorotate() -> Bool {
//        return true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//code goes here
    
    @IBOutlet weak var segmentedControl2: UISegmentedControl!
    @IBOutlet weak var pickerTemperature: UIPickerView!
    @IBOutlet weak var outLabel: UILabel!
    
    
    @IBAction func segmentedControlChanged2(sender: AnyObject) {
        
        if sender.selectedSegmentIndex == 0{
           
         values = (-129...134).map {$0}
            endStr="°F"
            endLabelStr="°C"
            pickerTemperature.reloadAllComponents()
            numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
            newTemperature = convertTemp(values[pickerTemperature.selectedRowInComponent(0)], boolInFaren: true)
            outLabel.text=(numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
           
            //F to C code goes here
        }
        else if sender.selectedSegmentIndex == 1
        {
           values = (-90...57).map {$0}
            endStr="°C"
            endLabelStr="°F"
            pickerTemperature.reloadInputViews()
            pickerTemperature.reloadAllComponents()
            numberFormatter.numberStyle = NSNumberFormatterStyle.NoStyle
            newTemperature = convertTemp(values[pickerTemperature.selectedRowInComponent(0)], boolInFaren: false)
            outLabel.text=(numberFormatter.stringFromNumber(newTemperature))!+endLabelStr
                        //C to F code goes here
            
        }
        
    }


    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return values.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row].description
        
    }
    

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
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var mutString = values[row].description+endStr
        return NSMutableAttributedString(string: mutString)
    }
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

