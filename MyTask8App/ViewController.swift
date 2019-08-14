//
//  ViewController.swift
//  MyTask8App
//
//  Created by VERTEX24 on 2019/08/12.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // はじめに入力された数字を保管する箱
    var previousNum: Double = 0;
    // 画面に表示させる数字
    var screenNum: Double = 0;
    // 計算処理をするか判断するやつ
    var math: Bool = false
    // 演算子の箱
    var operation = 0;
    // 計算結果を入れる箱
    var ansNum:Double  = 0
    // 最初の処理かどうか
    var isFirst = true
    // 数字を追加させない
    var notAddNum = true

    @IBOutlet weak var Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 整数か小数かを判断する関数
    func judg() {
        let ans: [String] = String(ansNum).components(separatedBy: ".")
        if ans[1] == "0" {
            Label.text = String((ansNum.description as  NSString).integerValue)
        }else {
            Label.text = String(ansNum)
        }
    }
    
 
    
    // 数字部分のボタンが押されたときの処理
    @IBAction func numbers(_ sender: UIButton) {
        if isFirst {
            isFirst = false
            Label.text! = ""
            // 一度だけ実行したい処理
        }
        if notAddNum {
            // 2個目の数字のとき
            if math == true {
                Label.text = String(sender.tag - 1)
                screenNum = Double(Label.text!)!
                math = false
                // はじめの数字のとき
            }else {
                Label.text = Label.text! + String(sender.tag - 1)
                screenNum = Double(Label.text!)!
            }
        }else{
            
        }
    }
    
    
    // 演算子部分のボタンが押されたときの処理
    @IBAction func operators(_ sender: UIButton) {
        if isFirst {
            isFirst = true
            Label.text! = ""
            // 一度だけ実行したい処理
        }
 
        // +,-,×,÷が押されたとき
        if Label.text != "" && sender.tag != 11 && sender.tag != 16 && operation == 0{
            previousNum = Double(Label.text!)!
            switch sender.tag {
            case 12:
                Label.text = "÷";
            case 13:
                Label.text = "×";
            case 14:
                Label.text = "-";
            default:
                Label.text = "+";
            }
            operation = sender.tag
            math = true
            notAddNum = true
        // 演算子が2度押されたとき
        }else if Label.text != "" && sender.tag != 11 && sender.tag != 16 && operation != 0{
            switch sender.tag {
            case 12:
                Label.text = "÷";
            case 13:
                Label.text = "×";
            case 14:
                Label.text = "-";
            default:
                Label.text = "+";
            }
            operation = sender.tag
            math = true
            notAddNum = true
         // =が押されたとき
        }else if sender.tag == 16 {
            switch operation {
            case 15:
                ansNum = previousNum + screenNum
            case 14:
                ansNum = previousNum - screenNum
            case 13:
                ansNum = previousNum * screenNum
            case 12:
                ansNum = previousNum / screenNum
            default:
                Label.text = Label.text
            }
            judg()
            operation = 0
            notAddNum = false
        // Cが押されたとき
        }else if sender.tag == 11 {
            previousNum = 0;
            screenNum = 0;
            operation = 0;
            Label.text = ""
            notAddNum = true
        }
        
    }
    
    
}

