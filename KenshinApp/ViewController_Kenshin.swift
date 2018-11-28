//
//  ViewController_Kenshin.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/30.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_Kenshin: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var kenshinTableView: UITableView!
    //selectedKenshinInput:選択した回分のお客さまをKenshinInputクラスの配列で保持
    var selectedKenshinInput: [KenshinInput] = []
    //selectedNumber:前画面で選択したお客さまの配列番号を保持する変数
    //viewDidLoad()のprint文みたいな方法で検針データを利用可能です
    var selectedNumber:Int = 0
    
    var kenshinItem: NSArray = ["お客さま名",
                                "ガスメーター設置場所番号",
                                "ガスメーター社番",
                                "今回指示数",
                                "今回使用量",
                                "回帰",
                                "前回指示数",
                                "前回使用量"]
 
    var kenshinData: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        kenshinData = [self.selectedKenshinInput[selectedNumber].s_NameJ,
                       self.selectedKenshinInput[selectedNumber].s_GasSecchi,
                       self.selectedKenshinInput[selectedNumber].s_MeterNo,
                       "",
                       "",
                       "",
                       self.selectedKenshinInput[selectedNumber].s_OldShiji,
                       self.selectedKenshinInput[selectedNumber].s_B1Ryo]
        
//        let barRightButton = UIBarButtonItem(barButtonSystemItem: "保存", target: self, action: "onClickMyBarButton:")
        //ナビゲーションバーの右側に編集ボタンを表示
        self.navigationItem.setRightBarButton(self.editButtonItem, animated: true)
        //テキストボックスフォーカス時に数字のみのキーボード表示
//        self.thisShijiNum.keyboardType = UIKeyboardType.numberPad

        kenshinTableView.register(UINib(nibName: "kenshinCustomCell", bundle: nil), forCellReuseIdentifier: "kenshinCustomCell")
        kenshinTableView.register(UINib(nibName: "kenshinCustomCellKaiki", bundle: nil), forCellReuseIdentifier: "kenshinCustomCellKaiki")

        // DataSourceの設定をする.
        kenshinTableView.dataSource = self
        // Delegateを設定する.
        kenshinTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(kenshinTableView)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
 //       kenshinData["今回使用量"] = String(Int(thisShijiNum.text!)! - Int(beforeShijiNum.text!)!)
    }
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kenshinItem.count
    }
    //Cellに値を設定する.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("indexPath:")
        print(indexPath.row)
        print(kenshinItem[indexPath.row])
        
        if(indexPath.row == 4){
            let cell = kenshinTableView.dequeueReusableCell(withIdentifier: "kenshinCustomCell") as! kenshinCustomCell
            cell.setupCell(lblName: kenshinItem[indexPath.row] as! String)
            return cell
        }
        if(indexPath.row == 6){
            let cell = kenshinTableView.dequeueReusableCell(withIdentifier: "kenshinCustomCellKaiki") as! kenshinCustomCellKaiki
            cell.setupCell(lblName: kenshinItem[indexPath.row] as! String)
            return cell
        }

        let kenshinInfoCell = kenshinTableView.dequeueReusableCell(withIdentifier: "kenshinInfoCell", for: indexPath)
        //横1行で表示できるように自動で調整してくれる
        kenshinInfoCell.textLabel?.adjustsFontSizeToFitWidth = true
        //改行させない
        kenshinInfoCell.textLabel?.numberOfLines = 0
        //項目名のフォントサイズを指定
        kenshinInfoCell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        kenshinInfoCell.textLabel?.text = kenshinItem[indexPath.row] as? String
        //データのフォントサイズを指定
        kenshinInfoCell.detailTextLabel?.font = UIFont.systemFont(ofSize: 24)
        kenshinInfoCell.detailTextLabel?.text = kenshinData[indexPath.row] as? String
        return kenshinInfoCell
    }
 
    //Editボタンが押された際に呼び出される
    override func setEditing(_ editing: Bool, animated: Bool) {
        //通常走っていた処理はそのまま走らせる。
        super.setEditing(editing, animated: true)
        //自分が持っているテーブルビューのeditingを更新する。
        self.kenshinTableView.setEditing(editing, animated: animated)
        
//        let kenshinAlert = UIAlertController(title: "使用量確認", message: "今回使用量：\n(kenshinData[4] as?String) \nこの使用量で登録してよろしいですか",  preferredStyle:UIAlertControllerStyle.alert)
        
        
    }

    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! ViewController_KenshinConform
        viewController.selectedKenshinInput = self.selectedKenshinInput
        viewController.selectedNumber = self.selectedNumber;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
