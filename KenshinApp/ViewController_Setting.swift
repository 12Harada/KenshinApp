//
//  ViewController_Setting.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/01.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController_Setting: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("【設定画面】")
        
        //タイトル名
        self.navigationController?.title = "設定"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
