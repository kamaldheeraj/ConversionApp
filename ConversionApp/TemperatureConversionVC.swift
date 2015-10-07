//
//  SecondViewController.swift
//  ConversionApp
//
//  Created by Kamal Dandamudi on 10/6/15.
//  Copyright (c) 2015 Kamal Dandamudi. All rights reserved.
//

import UIKit

class TemperatureConversionVC: UIViewController {
    var values = [Int]()
    
    var part = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

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
            
            values = [1, 2, 3]
            
            

            part = 1
            
            //F to C code goes here
        }
        else
        {
            
            values = [4,5,6]
            
            part = 2
            //C to F code goes here
            
        }
        
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerTemperature(_pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return values.count
    }
    
    func pickerTemperature(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row].description
        
    }
    func pickerTemperature(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        var newTemperature = 0.0
        
            var temperature = values[row]
        
        
        newTemperature = Double(temperature)
        
        outLabel.text = newTemperature.description

        
    }
    
    
}

