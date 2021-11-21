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
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateUserAge()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Cerramos el teclado
        textField.resignFirstResponder()
        
        print("Hemos pulsado la tecla enter en un textField")
        
        if let theText = textField.text {
            print(theText)
            self.userName = theText
        }
        
        return true
    }

    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        print(Int(sender.value))
        
        self.updateUserAge()
    }
    
    @IBAction func validateData(_ sender: UIButton) {
        
        if userName == "David Enrique"{
            
            self.view.backgroundColor = .yellow
            let alertName = UIAlertController(title: "خوش آمدی",
                                              message: "Bienvenido David el manbar",
                                              preferredStyle: .alert)
            alertName.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alertName, animated: true)
            
            
            
        }else if userAge >= 18{
            
            self.view.backgroundColor = .green

            let alertAge =  UIAlertController(title: "Puedes entrar \(userName)",
                                              message: "Eres mayor de edad",
                                              preferredStyle: .alert)
            alertAge.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(alertAge, animated: true)
            
            
        } else{
            
            self.view.backgroundColor = .red
            let alertNo = UIAlertController(title: "Yoy shall not pass",
                                            message: "Gandalf no te deja pasar",
                                            preferredStyle: .alert)
            alertNo.addAction(UIAlertAction(title: "Ok", style: .default))

            self.present(alertNo, animated: true)
        }
    }
    
    func updateUserAge(){
        userAge = Int(self.sliderAge.value)
        labelAge.text = "\(userAge)"
    }
    
}

