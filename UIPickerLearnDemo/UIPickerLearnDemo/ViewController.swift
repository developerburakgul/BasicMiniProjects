//
//  ViewController.swift
//  UIPickerLearnDemo
//
//  Created by Burak Gül on 15.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    

    var backGroundColors = [
        
        "white" : UIColor.white,
        "black" : UIColor.black,
        "blue"  : UIColor.blue,
        "green" : UIColor.green,
        "red"   : UIColor.red,
        "yellow" : UIColor.yellow
    ]
    
    var textColors = [
        "white" : UIColor.white,
        "black" : UIColor.black,
        "blue"  : UIColor.blue,
        "green" : UIColor.green,
        "red"   : UIColor.red,
        "yellow" : UIColor.yellow,
        "purple" : UIColor.purple
    
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
    }


}

//MARK: - UIPickerViewDataSource
extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return Array(backGroundColors).count
        } else {
            return Array(textColors).count
        }
        
    }
    
    
    
}

//MARK: -  UIPickerViewDelegate
extension ViewController : UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
           
        if component == 0 {
            return Array(backGroundColors)[row].key
        } else {
            return Array(textColors)[row].key
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
//            label1.text = Array(backGroundColors)[row].key
            label1.textColor = Array(backGroundColors)[row].value
        }else {
//            label2.text = Array(textColors)[row].key
            label2.textColor = Array(textColors)[row].value
        }
    }
    
    
    
}

