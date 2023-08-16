//
//  ViewController.swift
//  UIPickerLearnDemo2
//
//  Created by Burak Gül on 16.08.2023.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate,UIPickerViewDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textField2: UITextView!
    let data = ["burak","batuhan","furkan","ibrahim","emirhan"]
    let data2 = ["burak","batuhan","furkan","ibrahim","emirhan","galip","talha","kadir"]
    let picker =  UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.delegate = self
        picker.dataSource = self
        picker.delegate = self
        textField.inputView = picker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker))
        view.addGestureRecognizer(tapGesture)
        createToolbar()
    }
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissPicker))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
    }


}




extension ViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return data.count
        }
        return data2.count
    }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if component == 0 {
                textField.text = data[row]
            }else {
                textField2.text = data2[row]
            }
            
            //        textField.endEditing(true) // in this line ; if you can select any item, picker is going to close.
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if component == 0 {
                return data[row]
            }else {
                return data2[row]
            }
        }
        
        
    }
    


