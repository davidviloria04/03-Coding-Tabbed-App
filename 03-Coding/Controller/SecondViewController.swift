//
//  SecondViewController.swift
//  03-Coding
//
//  Created by David Viloria Ortega on 11/19/21.
//  Copyright © 2021 David Viloria Ortega. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Cerramos el teclado
        textField.resignFirstResponder()
        
        if let theNumber = textField.text {
            print("Has ingresado el numero \(theNumber) es correcto?")
        }
        
        return true
    }


}

