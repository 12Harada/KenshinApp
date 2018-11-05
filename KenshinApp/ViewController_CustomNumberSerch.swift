//
//  ViewController_CustomNumberSerch.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/07.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_CustomNumberSerch: UIViewController {

    @IBOutlet weak var customerNumText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //テキストボックスフォーカス時に数字のみのキーボード表示
        self.customerNumText.keyboardType = UIKeyboardType.numberPad
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSerch(_ sender: UIButton) {

        // キーボードを閉じる
        customerNumText.endEditing(true)
//        入力された客番で対象お客様を検索する
        //        customerNumText
        
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
