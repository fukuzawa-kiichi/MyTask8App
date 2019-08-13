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
    // 最初の処理かどうか
    var isFirst = true

    @IBOutlet weak var Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 数字部分のボタンが押されたときの処理
    @IBAction func numbers(_ sender: UIButton) {
        if isFirst {
            isFirst = false
            Label.text! = ""
            // 一度だけ実行したい処理
        }
        
        if math == true {
            Label.text = String(sender.tag - 1)
            screenNum = Double(Label.text!)!
            math = false

        }else {
            Label.text = Label.text! + String(sender.tag - 1)
            screenNum = Double(Label.text!)!
        }
    }
    
    // 演算子部分のボタアンが押されたときの処理
    @IBAction func operators(_ sender: UIButton) {
        if Label.text != "" && sender.tag != 11 && sender.tag != 16 {
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
            math = true;
        }else if sender.tag == 16 {
            switch operation {
            case 15:
                Label.text = String(previousNum + screenNum)
            case 14:
                Label.text = String(previousNum - screenNum)
            case 13:
                Label.text = String(previousNum * screenNum)
            default:
                Label.text = String(previousNum / screenNum)
            }
        }else if sender.tag == 11 {
            previousNum = 0;
            screenNum = 0;
            operation = 0;
            Label.text = ""
        }
        
    }
    
    
}

