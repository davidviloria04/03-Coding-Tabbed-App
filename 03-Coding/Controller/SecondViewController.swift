//
//  SecondViewController.swift
//  03-Coding
//
//  Created by David Viloria Ortega on 11/19/21.
//  Copyright © 2021 David Viloria Ortega. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNumber: UILabel!
    
    var fibonacci: [Int] = [0,1]
    var fibID = 1
    var wantsGoldNumber = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabel(id: Int(self.stepper.value))
        generateFibonacciNumbers()
    }
    
    func generateFibonacciNumbers() {
        if fibID <= 1 || fibID > 100{
            return
        }
        
        //Generar los numeros de fibonacci hasta el Fib
        fibonacci = [0,1]
        
        for i in 2...fibID {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
        let fibStr: [String] = fibonacci.compactMap({String($0)})
        let result: String = fibStr.joined(separator: "\n")
        self.textViewResult.text  = result
    }
    
    
    @IBAction func stepperPresedd(_ sender: UIStepper) {
        
        //self.fibID  = Int(sender.value)
        updateLabel(id: Int(sender.value))
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        
        self.wantsGoldNumber = sender.isOn
        calculatedGoldNumber()
    
    }
    
    func calculatedGoldNumber(){
        if self.wantsGoldNumber {
            //Hay que generar el numero de oro como cociente entre los dos ultimos numeros de Fibonacci
            
            let last = Double(fibonacci[fibonacci.count-1])
            let previousLast = Double(fibonacci[fibonacci.count-2])
            let goldNumber = last / previousLast
            self.labelGoldNumber.text = "\(goldNumber)"
            
        }else{
            //Podemos un texto por defecto en la etiqueta
            self.labelGoldNumber.text = "Ver el numero de oro"
        }
    }
    
    
    func updateLabel(id: Int){
        self.fibID = id
        self.labelNumber.text = "\(self.fibID)"
        generateFibonacciNumbers()
    }
    
}

