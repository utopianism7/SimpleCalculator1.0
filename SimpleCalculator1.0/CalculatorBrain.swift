//
//  CalculatorBrain.swift
//  SimpleCalculator1.0
//
//  Created by jarvis.zeng on 15/6/23.
//  Copyright (c) 2015年 jarvis.zeng. All rights reserved.
//

import Foundation

class CalculatorBrain
{
    
    enum Op{
        case Operand(Double)
        case UnaryOperation(String, Double -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    var opStack = [Op]()
    
    func pushOperand(operand: Double){
        opStack.append(<#newElement: T#>)
    }
    
    
    
}