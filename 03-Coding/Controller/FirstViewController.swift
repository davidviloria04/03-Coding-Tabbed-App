//
//  FirstViewController.swift
//  03-Coding
//
//  Created by David Viloria Ortega on 11/19/21.
//  Copyright © 2021 David Viloria Ortega. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAge = Int(sliderAge.value)
        labelAge.text = "\(userAge)"
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Cerramos el teclado
        textField.resignFirstResponder()
        
        print("Hemos pulsado la tecla enter en un textField")
        
        if let theText = textField.text {
            print(theText)
        }
        
        return true
    }

    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        print(Int(sender.value))
        
        userAge = Int(sender.value)
        print(userAge)
        labelAge.text = "\(userAge)"
        
    }
    
}

