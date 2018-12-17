//
//  ViewController_CustomInfo.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/30.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_CustomInfo: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //画面表示するデータを読み込む（前画面からの受取り)
    //selectedKenshinInput:選択した回分のお客さまをKenshinInputクラスの配列で保持
    var selectedKenshinInput: [KenshinInput] = []
    //selectedNumber:前画面で選択したお客さまの配列番号を保持する変数
    var selectedNumber:Int = 0
    
    @IBOutlet weak var customerTableView: UITableView!
    //表示する項目名を設定
    var customItem: NSMutableArray = ["お客さま名",
                               "住所",
                               "建物",
                               "ガスメーター設置場所番号",
                               "開閉栓状態",
                               "契約小売",
                               "検針方法",
                               "お客さま電話番号",
                               "犬情報",
                                ""]
    
    var customData: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面名を作成
        self.navigationItem.title = "お客さま情報表示"
        //表示するデータの設定（ファイルにデータが無いものはベタ書き。後で修正）
        //お客さま情報

        //お客さま番号ハイフン編集
        let gmtNum = selectedKenshinInput[selectedNumber].s_GasSecchi.splitInto(1)
        
        //お客さま番号
        let gasSetti = gmtNum[0] + gmtNum[1] + gmtNum[2] + gmtNum[3] + "-" + gmtNum[4] + gmtNum[5] + gmtNum[6] + "-" + gmtNum[7] + gmtNum[8] + gmtNum[9] + gmtNum[10]
        //開閉栓状態
        let kaiheiCode = decodeMeterState(code: selectedKenshinInput[selectedNumber].s_UseCd)
        //検針方法
        let kenshinMethod = decodeKenshinMethod(code: selectedKenshinInput[selectedNumber].s_HohoCd)
        //契約種別
        let keiyakuContract = decodeContract(code: self.selectedKenshinInput[selectedNumber].s_KeiyakuType)
        customData =
            [trimSpace(customInput: self.selectedKenshinInput[selectedNumber].s_NameJ),
            "東京都中央区銀座４−３−２",
            trimSpace(customInput: self.selectedKenshinInput[selectedNumber].s_AptJ) +
            trimSpace(customInput: self.selectedKenshinInput[selectedNumber].s_AptMeiC2) +
            trimSpace(customInput: self.selectedKenshinInput[selectedNumber].s_AptMeiC3),
            gasSetti,
            kaiheiCode,
            keiyakuContract,
            kenshinMethod,
            selectedKenshinInput[selectedNumber].s_TelNo,
            "犬あり小型犬",
            "検針結果を報告する"
        ]
        
        // Cell名の登録をおこなう.
        customerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "customInfoCell")
        // DataSourceの設定をする.
        customerTableView.dataSource = self
        // Delegateを設定する.
        customerTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(customerTableView)

        print("画面名：お客さま情報画面")
        print(selectedNumber)

        //ナビゲーションバーの右側に編集ボタンを表示
        self.navigationItem.setRightBarButton(self.editButtonItem, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "編集", style: .plain, target: nil, action: #selector(setEditing))
        

    }
    
    //編集ボタンが押された際に呼び出される
    @objc override func setEditing(_ editing: Bool, animated: Bool) {
        //通常走っていた処理はそのまま走らせる。
        super.setEditing(editing, animated: true)
        //自分が持っているテーブルビューのeditingを更新する。
        self.customerTableView.setEditing(editing, animated: true)
        // 編集中のときのみaddButtonをナビゲーションバーの左に表示する
        if editing {
            print("編集中")
            let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(self.addCell(sender:)))
                
            self.navigationItem.setLeftBarButton(addButton, animated: true)
        } else {
            print("通常モード")
            self.navigationItem.setLeftBarButton(nil, animated: true)
        }
    
    }
    @objc func addCell(sender: AnyObject) {
        print("追加")
        
        // myItemsに追加.
        //        customData.add("add Cell")
        
        // TableViewを再読み込み.
        customerTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //dataを消してから
        customData.removeObject(at: indexPath.row)
        //tableViewCellの削除
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return customItem.count
    }
    //Cellに値を設定する.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let customInfoCell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "customInfoCell")
        //横1行で表示できるように自動で調整してくれる
        customInfoCell.textLabel?.adjustsFontSizeToFitWidth = true
        //改行させない
 //       customInfoCell.textLabel?.numberOfLines = 0
        // 選択された背景色を白に設定
        let cellSelectedBgView = UIView()
        cellSelectedBgView.backgroundColor = UIColor.white
        customInfoCell.selectedBackgroundView = cellSelectedBgView

        print(customItem[indexPath.row])
        print(customData[indexPath.row])
        //項目名のフォントサイズを指定
        customInfoCell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        customInfoCell.textLabel?.text = customItem[indexPath.row] as? String
        //データのフォントサイズを指定
        customInfoCell.detailTextLabel?.font = UIFont.systemFont(ofSize: 17)
        customInfoCell.detailTextLabel?.text = customData[indexPath.row] as? String
        customInfoCell.detailTextLabel?.textColor = UIColor.black
        if indexPath.row == (customItem.count - 2) {
            customInfoCell.textLabel?.textColor = UIColor.red
            customInfoCell.detailTextLabel?.textColor = UIColor.red
        }
        if indexPath.row == (customItem.count - 1) {
            customInfoCell.detailTextLabel?.textColor = UIColor.blue
            customInfoCell.detailTextLabel?.font = UIFont.systemFont(ofSize: 17)

        }
        print("indexPath.row: \(indexPath.row)")
        print("customItem.count: \(customItem.count)")
        return customInfoCell
    }
    
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        print(indexPath.row)
        //検針結果報告へをタップされたら次画面へ遷移させる
        if indexPath.row == (customItem.count - 1) {
            performSegue(withIdentifier: "kenshinDoSegue",sender: nil)
        }
    }

    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! TableViewController_kenshinDo
        viewController.selectedKenshinInput = self.selectedKenshinInput
        viewController.selectedNumber = self.selectedNumber;
        
    }

    private func trimSpace(customInput: String) -> String {
        let outData = customInput.trimmingCharacters(in: .whitespaces)
        return outData
    }
    
    //開閉栓状態のデコード
    private func decodeMeterState(code :String) -> String {
        
        switch code {
        case "1":
            return "開栓中"
        case "2":
            return "閉栓中"
        default:
            return "開栓中"
        }
        
    }
    //検針方法のデコード
    private func decodeKenshinMethod(code :String) -> String {
        
        switch code {
        case "11":
            return "電話"
        case "21":
            return "はこ"
        case "31":
            return "帳票"
        default:
            return "はこ"
        }
        
    }

    //検針方法のデコード
    private func decodeContract(code :String) -> String {
        
        switch code {
        case "101":
            return "一般契約"
        case "226":
            return "ゆったりエコプラン"
        default:
            return "一般契約"
        }
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
