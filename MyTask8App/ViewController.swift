//
//  ViewController.swift
//  MyTask8App
//
//  Created by VERTEX24 on 2019/08/12.
//  Copyright © 2019 VERTEX24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ansLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // 数字部分のボタンが押されたときの処理
    @IBAction func numbers(_ sender: UIButton) {
        ansLabel.text = String(sender.tag - 1)
    }
    
    // 演算子部分のボタアンが押されたときの処理
    @IBAction func operators(_ sender: UIButton) {
        
    }
    
    
    
}

