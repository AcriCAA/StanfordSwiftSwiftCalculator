//
//  ViewController.swift
//  Calculator
//
//  Created by Corey Acri on 10/26/15.
//  Copyright © 2015 Corey. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{



    @IBOutlet weak var display: UILabel!
//            variable name     type
// ^^^ syntax

    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton) {
    
        
        let digit = sender.currentTitle!
        print("digit equals \(digit)")
        if userIsInTheMiddleOfTypingANumber{
        display.text = display.text! + digit
        } else {
        display.text = digit
        userIsInTheMiddleOfTypingANumber = true
        
        }
    }
    
    
    

    
    
    
    @IBAction func operate(sender: UIButton) {
        
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        
        switch operation {
        
        case"×": performOperation {$0 * $1}
           //        case"÷":
//        case"+":
//        case"−":
        default: break
        
        }
        
    }
    
    
    func performOperation(operation: (Double, Double) ->Double ){
        if operandStack.count >= 2{
        displayValue = operandStack.removeLast() * operandStack.removeLast()
        enter()
                }
    
    }
    
    var operandStack = Array<Double>()
   
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("operandStack = \(operandStack)")
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set
        {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    
 
}

