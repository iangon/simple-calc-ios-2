//
//  ViewController.swift
//  simple-calc
//
//  Created by Ian on 10/22/16.
//  Copyright © 2016 Ian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueLabel: UILabel!
    private var operands : Array<Int> = []
    private var operators : Array<String> = []
    private var arrayCounter : Int = 0
    private var currentNum : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberButtonPress(_ sender: UIButton) {
        let numValueString = sender.currentTitle!
        let isOperatorIndexValid = operators.indices.contains(operands.count)

        if !isOperatorIndexValid {
            currentNum += numValueString
        } 
        
    }
    
    @IBAction func operatorButtonPress(_ sender: UIButton) {
        operands.append(Int(currentNum)!)
        currentNum = ""
        
        let oper = sender.currentTitle!
        operators.append(sender.currentTitle!)
        arrayCounter += 1

        if oper == "=" || oper == "fact()" {
            valueLabel.text = String(calculate(operands, operators))
            operands=[]
            operators=[]
            arrayCounter = 0
            return
        }
    }
    
    private func calculate(_ operands: Array<Int>, _ operators: Array<String>) -> Double {
        var isAvg : Bool = false
        var total : Double = Double(operands[0])
        for index in 1 ... operands.count {
            let oper = operators[index-1]
            switch oper {
            case "+":
                total = add(left:total, right: Double(operands[index]))
            case "-":
                total = subtract(left: total, right: Double(operands[index]))
            case "/":
                total = divide(left: total, right: Double(operands[index]))
            case "x":
                total = multiply(left: total, right: Double(operands[index]))
            case "fact()":
                total = Double(factorial(Int(total)))
            case "avg()":
                isAvg = true
            case "count()":
                return Double(operands.count)
            default:
                break
            }
            
            if isAvg == true {
                return Double(average(array: operands))
            }
        }
        return total

    }
    
    func factorial(_ n: Int) -> Int {
        var result : Int
        if n==0 || n==1 {
            return 1
        }
        
        result = factorial(n - 1) * n
        return result
    }
    
    /*
     *  Add function
     */
    func add(left: Double, right: Double) -> Double {
        return left + right
    }
    
    /*
     *  add array function.
     */
    func add(array: Array<Int>) -> Int {
        var result : Int = 0
        
        for num in array {
            result += num
        }
        
        return result
    }
    
    /*
     *  subtract function
     */
    func subtract(left: Double, right: Double) -> Double {
        return left - right
    }
    
    /*
     *  divide function
     */
    func divide(left: Double, right: Double) -> Double {
        return left / right
    }
    
    /*
     *  multiply function
     */
    func multiply(left: Double, right: Double) -> Double {
        return left * right
    }
    
    /*
     *  multiply array function.
     */
    func multiply(array: Array<Int>) -> Int {
        var result : Int = array[array.count - 1]
        
        for index in 0 ... array.count - 2 {
            result *= array[index]
        }
        return result
    }
    
    /*
     *  count array function.
     */
    func count(array: Array<Int>) -> Int {
        return array.count
    }
    
    /*
     *  avg array function.
     */
    func average(array: Array<Int>) -> Int {
        var numerator : Int = 0
        let denominator = array.count
        for num in array {
            numerator += num
        }
        
        return numerator / denominator
    }
}

