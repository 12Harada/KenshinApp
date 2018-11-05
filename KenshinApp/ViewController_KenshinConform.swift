//
//  ViewController_KenshinConform.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/10/15.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_KenshinConform: UIViewController {

    @IBOutlet weak var customName: UILabel!
    @IBOutlet weak var meterNumber: UILabel!
    @IBOutlet weak var thisShijiNum: UILabel!
    @IBOutlet weak var thisVolume: UILabel!
    var s_thisVolume = ""
    
    
    //selectedKenshinInput:選択した回分のお客さまをKenshinInputクラスの配列で保持
    var selectedKenshinInput: [KenshinInput] = []
    //selectedNumber:前画面で選択したお客さまの配列番号を保持する変数
    //viewDidLoad()のprint文みたいな方法で検針データを利用可能です
    var selectedNumber:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customName.text = self.selectedKenshinInput[selectedNumber].s_NameJ
        // データにない
        //        meterNumber.text = self.selectedKenshinInput[selectedNumber].
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_Buck(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "NextCustomSegue", sender: nil)

    }

    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! ViewController_CustomInfo
        viewController.selectedKenshinInput = self.selectedKenshinInput
        viewController.selectedNumber = self.selectedNumber + 1
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
