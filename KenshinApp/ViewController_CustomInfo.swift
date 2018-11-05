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
    var customItem: NSArray = ["お客さま名", "住所", "建物", "支払い方法", "払込書発行", "電気契約", "契約小売"]
    var kenshinItem: NSArray = ["検針方法", "郵送先設定", "料金発生年月日"]
    var meterItem: NSArray = ["メーター設置場所番号", "開閉栓状態", "検満年月", "メーター位置"]
    var etcItem: NSArray = ["犬情報", "サービス情報"]
    //セクション名を設定
    var  s_Section = ["お客さま情報", "検針情報", "メーター情報", "その他情報"]
    
    var customData: NSArray = []
    var kenshinData: NSArray = []
    var meterData: NSArray = []
    var etcData: NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画面名を作成
        self.navigationItem.title = "CustomerInfo"

        //表示するデータの設定（ファイルにデータが無いものはベタ書き。後で修正）
        //お客さま情報
        customData =  [self.selectedKenshinInput[selectedNumber].s_NameJ, "東京都中央区銀座４−３−２", self.selectedKenshinInput[selectedNumber].s_AptJ + self.selectedKenshinInput[selectedNumber].s_AptMeiC2 + self.selectedKenshinInput[selectedNumber].s_AptMeiC3, "口座振替", "払込書発行あり", "電気契約なし", "東京ガス"]
        //検針情報
        kenshinData = ["はこ", "郵送先設定なし", self.selectedKenshinInput[selectedNumber].s_HasseiDate]
        //メーター情報
        meterData = [self.selectedKenshinInput[selectedNumber].s_GasSecchi, self.selectedKenshinInput[selectedNumber].s_UseCd, "2020/10/10", "アウトメータ台所の外　右へ"]
        //その他情報
        etcData = ["犬あり大型犬", "DM拒否"]
        
        // Status Barの高さを取得を.する.
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        // Viewの高さと幅を取得する.
//        let displayWidth: CGFloat = self.view.frame.width
//        let displayHeight: CGFloat = self.view.frame.height
//
//        // TableViewの生成( status barの高さ分ずらして表示 ).
//        let infoTableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        
        // Cell名の登録をおこなう.
        let infoTableView: UITableView = UITableView()
        infoTableView.register(UITableViewCell.self, forCellReuseIdentifier: "customInfoCell")
        // DataSourceの設定をする.
        infoTableView.dataSource = self
        // Delegateを設定する.
        infoTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(infoTableView)

        print("画面名：お客さま情報画面")
        //データが渡されているか確認
        print("selectedNumber: \(selectedNumber)")
        print("お客さま名:\(self.selectedKenshinInput[selectedNumber].s_NameJ)")

    }
    // セクションの数を返す。
    func numberOfSections(in tableView: UITableView) -> Int {
        print(s_Section.count)
        return s_Section.count
    }
    // セクションのタイトルを返す。
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(s_Section[section])
         return s_Section[section]
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    //テーブルに表示する配列の総数を返す.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        switch section {
        case 0:
            return customItem.count
        case 1:
            return kenshinItem.count
        case 2:
            return meterItem.count
        case 3:
            return etcItem.count
        default:
            print("Error")
            return 0
        }
    }
    private func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> Int {
        return 50
    }
    //Cellに値を設定する.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let customInfoCell = tableView.dequeueReusableCell(withIdentifier: "customInfoCell", for: indexPath as IndexPath)
            
        customInfoCell.textLabel?.adjustsFontSizeToFitWidth = true
        customInfoCell.textLabel?.numberOfLines = 0
        //配列化した文言の数分、画面表示
        switch indexPath.section {
        case 0:
            print(customItem[indexPath.row])
            print(customData[indexPath.row])
            customInfoCell.textLabel?.text = customItem[indexPath.row] as? String
            customInfoCell.detailTextLabel?.text = customData[indexPath.row] as? String
        case 1:
            print(kenshinItem[indexPath.row])
            print(kenshinData[indexPath.row])
            customInfoCell.textLabel?.text = "\(kenshinItem[indexPath.row])"
            customInfoCell.detailTextLabel?.text = "\(kenshinData[indexPath.row])"
        case 2:
            print(meterItem[indexPath.row])
            print(meterData[indexPath.row])
            customInfoCell.textLabel?.text = "\(meterItem[indexPath.row])"
            customInfoCell.detailTextLabel?.text = "\(meterData[indexPath.row])"
        case 3:
            print(etcItem[indexPath.row])
            print(etcData[indexPath.row])
            customInfoCell.textLabel?.text = "\(etcItem[indexPath.row])"
            customInfoCell.detailTextLabel?.text = "\(etcData[indexPath.row])"
        default:
            print("Error")
        }
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
