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
    //viewDidLoad()のprint文みたいな方法で検針データを利用可能です
    var selectedNumber:Int = 0
    
    @IBOutlet weak var customerTableView: UITableView!
    
    //表示する項目名を設定
    var customItem: NSArray = ["お客さま名",
                               "住所",
                               "建物",
                               "ガスメーター設置場所番号",
                               "開閉栓状態",
                               "契約小売",
                               "検針方法",
                               "お客さま電話番号",
                               "犬情報"]
    
    //セクション名を設定
//    var  s_Section = ["お客さま情報", "検針情報", "メーター情報", "その他情報"]
//
    var customData: NSArray = []
//
//
//    var kenshinData: NSArray = []
//    var meterData: NSArray = []
//    var etcData: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面名を作成
        self.navigationItem.title = "CustomerInfo"

        //表示するデータの設定（ファイルにデータが無いものはベタ書き。後で修正）
        //お客さま情報
        customData =
            [self.selectedKenshinInput[selectedNumber].s_NameJ,
            "東京都中央区銀座４−３−２",
            self.selectedKenshinInput[selectedNumber].s_AptJ +
            self.selectedKenshinInput[selectedNumber].s_AptMeiC2 +
            self.selectedKenshinInput[selectedNumber].s_AptMeiC3,
            self.selectedKenshinInput[selectedNumber].s_GasSecchi,
            self.selectedKenshinInput[selectedNumber].s_UseCd,
            self.selectedKenshinInput[selectedNumber].s_KeiyakuType,
            "はこ",
            self.selectedKenshinInput[selectedNumber].s_TelNo,
            "犬あり小型犬"]
        
        // Status Barの高さを取得を.する.
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        // Viewの高さと幅を取得する.
//        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
//
//        // TableViewの生成( status barの高さ分ずらして表示 ).
//        let infoTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
         customerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "customInfoCell")
        // DataSourceの設定をする.
        customerTableView.dataSource = self
        // Delegateを設定する.
        customerTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(customerTableView)

        print("画面名：お客さま情報画面")
        //データが渡されているか確認
        print("selectedNumber: \(selectedNumber)")
        print("お客さま名:\(self.selectedKenshinInput[selectedNumber].s_NameJ)")
        //ナビゲーションバーの右側に編集ボタンを表示
        self.navigationItem.setRightBarButton(self.editButtonItem, animated: true)

    }
//    // セクションの数を返す。
//    func numberOfSections(in tableView: UITableView) -> Int {
//        print(s_Section.count)
//        return s_Section.count
//    }
//    // セクションのタイトルを返す。
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        print(s_Section[section])
//         return s_Section[section]
//    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 50
//    }
//    private func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> Int {
//        return 50
//    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        //通常走っていた処理はそのまま走らせる。
        super.setEditing(editing, animated: true)
        
        //自分が持っているテーブルビューのeditingを更新する。
        self.customerTableView.setEditing(editing, animated: animated)
    }
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return customItem.count
    }
    //Cellに値を設定する.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customInfoCell = tableView.dequeueReusableCell(withIdentifier: "customInfoCell", for: indexPath as IndexPath)
            
        customInfoCell.textLabel?.adjustsFontSizeToFitWidth = true
        customInfoCell.textLabel?.numberOfLines = 0
        print(customItem[indexPath.row])
        print(customData[indexPath.row])
        customInfoCell.textLabel?.text = customItem[indexPath.row] as? String
        customInfoCell.detailTextLabel?.text = customData[indexPath.row] as? String
        return customInfoCell
    }
    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! ViewController_Kenshin
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
