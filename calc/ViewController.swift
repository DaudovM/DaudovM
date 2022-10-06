//
//  ViewController.swift
//  calc
//
//  Created by Мухаммадхаджи Даудов on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var number1: Double?
    var number2: Double?
    var operation: Int = 0
    var sigh: Bool = false
    var array = [Character]()
    var symbolMinus = " "
    var plusminus: Bool = false //проверяет есть ли Символ "-" в строке
    var nn: Bool = false // проверяет есть ли Символ "." в строке
    var mm = true   //Проверает нажал ли кнопки Вычисление
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var buttonTochka: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if label.text == "" {
            
        }
    }
    @IBAction func button(_ sender: UIButton) {
        
        if sigh == true{
            label.text = String(sender.tag)
            sigh = false
        }else{
            label.text! += String(sender.tag)
        }
        number2 = Double(label.text!)
        for i in label.text! {
            array += [i]
            if (array.firstIndex(of: ".") != nil) {
                nn = true
            } else if (array.firstIndex(of: "-") != nil) {
                plusminus = true
                
            }
            
        }
    }
    @IBAction func buttontochka(_ sender: UIButton) {
        if label.text != "" && label.text != "/" && label.text != "x" && label.text != "-" && label.text != "+" && nn != true{
            label.text! += "."
            nn = true
        }else if mm != true {
            label.text! += "."
            mm = true
        }
    }
    @IBAction func plusminus(_ sender: UIButton) {
        if label.text != "/" && label.text != "x" && label.text != "-" && label.text != "+" && plusminus != true {
            symbolMinus = "-"
            label.text = symbolMinus + label.text!
            plusminus = true
            
        }else {
            label.text?.removeFirst()
            plusminus = false
        }
    }
    @IBAction func buttonsigh(_ sender: UIButton) {
        mm = false
        plusminus = false
        if label.text != "" && sender.tag != 16 &&
            sender.tag != 10 && label.text != "+"
            && label.text != "-" && label.text != "x" && label.text != "/"{
            number1 = Double(label.text!)
            switch sender.tag {
            case 11: label.text = "/"
            case 12: label.text = "x"
            case 13: label.text = "-"
            case 14: label.text = "+"
            case 15: label.text = String(number1! / 100)
            default:
                break
            }
            sigh = true
            operation = sender.tag //присвоить теги на переменную
            
        }
        else if sender.tag == 16 {
            mm = true
            if operation == 11 {
                label.text = String(number1! / number2!)
            }else if operation == 12 {
                label.text = String(number1! * number2!)
            }
            else if operation == 13 {
                label.text = String(number1! - number2!)
            }else if operation == 14 {
                label.text = String(number1! + number2!)
            }
        }else if sender.tag == 10{
            label.text = ""
            number1 = 0
            number2 = 0
            array.removeAll()
            nn = false
            plusminus = false
            symbolMinus = "-"
            mm = true
        }
    }
}

