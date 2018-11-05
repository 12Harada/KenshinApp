//
//  ViewController_Kenshin.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/30.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_Kenshin: UIViewController {
    
    @IBOutlet weak var customName: UILabel!
    @IBOutlet weak var meterNumber: UILabel!
    @IBOutlet weak var thisShijiNum: UITextField!
    @IBOutlet weak var thisVolume: UILabel!
    @IBOutlet weak var beforeShijiNum: UILabel!
    @IBOutlet weak var beforeVolume: UILabel!

    //selectedKenshinInput:選択した回分のお客さまをKenshinInputクラスの配列で保持
    var selectedKenshinInput: [KenshinInput] = []
    //selectedNumber:前画面で選択したお客さまの配列番号を保持する変数
    //viewDidLoad()のprint文みたいな方法で検針データを利用可能です
    var selectedNumber:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //前画面から受け取った情報を画面表示させる
        customName.text = self.selectedKenshinInput[selectedNumber].s_NameJ
//        データにない（メーター社番）
//        meterNumber.text = self.selectedKenshinInput[selectedNumber].
        beforeVolume.text = self.selectedKenshinInput[selectedNumber].s_B1Ryo

        
//        データにない（前回指示数）
//        beforeShijiNum.text = self.selectedKenshinInput[selectedNumber].
        //前回使用量
        beforeVolume.text = self.selectedKenshinInput[selectedNumber].s_B1Ryo
    
        thisShijiNum.addTarget(self, action:Selector(("textFieldDidChange:")),for: UIControlEvents.editingChanged)
    
    }
    

    func textFieldDidChange(textFiled: UITextField) {
        thisVolume.text = String(Int(thisShijiNum.text!)! - Int(beforeShijiNum.text!)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! ViewController_KenshinConform
        viewController.selectedKenshinInput = self.selectedKenshinInput
        viewController.selectedNumber = self.selectedNumber
        viewController.s_thisVolume = thisVolume.text!
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
