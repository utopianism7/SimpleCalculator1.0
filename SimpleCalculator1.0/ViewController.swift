//
//  ViewController.swift
//  SimpleCalculator1.0
//
//  Created by jarvis.zeng on 15/6/19.
//  Copyright (c) 2015年 jarvis.zeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypeingANumber: Bool = false

    @IBAction func AppendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypeingANumber {
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypeingANumber = true
        
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypeingANumber {
            enter()
        }
        switch operation{
        case"×": performOperation {$0 * $1}
        case"÷": performOperation {$1 % $0}
        case"+": performOperation {$0 + $1}
        case"-": performOperation {$1 - $0}
        case"√": performOperation1 {sqrt($0)}
        default: break
        }
    }
    func performOperation(operation: (Double, Double) -> Double){
        if oprandStack.count >= 2 {
            displayValue = operation(oprandStack.removeLast(), oprandStack.removeLast())
            enter()
        }
    
    }
    func performOperation1(operation: Double -> Double){
        if oprandStack.count >= 1 {
            displayValue = operation(oprandStack.removeLast())
            enter()
        }
        
    }
    
    
    var oprandStack = Array<Double>()
    @IBAction func enter() {
        userIsInTheMiddleOfTypeingANumber  = false
        oprandStack.append(displayValue)
        println("oprandStack = \(oprandStack)")
    }
    
    var displayValue: Double{
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        
        }
        set{
            display.text = "\(newValue)"
        
        }
    
    
    }


}

