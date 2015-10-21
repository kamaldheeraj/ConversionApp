//
//  DistanceConversionVC.swift
//  ConversionApp
//
///  Created by Pravin Kandala, Kamal Dandamudi on 10/12/15.
//  Copyright (c) 2015  All rights reserved.
//

import UIKit

class DistanceConversionVC: UIViewController {

    
    let milesToKil = 1.60934
    let kilTomiles = 0.621371
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var changingFromLabel: UILabel!
    @IBOutlet weak var changingToLabel: UILabel!
    
    @IBOutlet weak var changingTextField: UITextField!
    
    @IBOutlet weak var changedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func supportedInterfaceOrientations() -> Int {
//        return Int(UIInterfaceOrientationMask.All.rawValue)
//    }
//    override func shouldAutorotate() -> Bool {
//        return true
//    }

    
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
    
    
    @IBAction func convertPressed(sender: AnyObject) {
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        if let number=changingTextField.text.toDouble() {
            if segmentedControl.selectedSegmentIndex==0{
                changedLabel.text = convertDistanceFrom(number, usingFactor: milesToKil)
            }
            else{
                changedLabel.text = convertDistanceFrom(number, usingFactor: kilTomiles)
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
