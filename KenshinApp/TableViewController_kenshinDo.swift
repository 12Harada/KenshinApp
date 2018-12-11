//
//  TableViewController_kenshinDo.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/12/09.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class TableViewController_kenshinDo: UITableViewController, UITextFieldDelegate {
        

    //データ領域の表示変数
    @IBOutlet weak var thisUseGas: UITextField!
    @IBOutlet weak var kaikiSwitch: UISwitch!
    @IBOutlet weak var thisUseGasRyo: UILabel!
    @IBOutlet weak var kaikiSwitchState: UILabel!
    @IBOutlet weak var targetNumber: UILabel!
    @IBOutlet weak var customName: UILabel!
    @IBOutlet weak var meterNumber: UILabel!
    
    @IBOutlet weak var beforeUseGas: UILabel!
    @IBOutlet weak var beforeUseGasRyo: UILabel!
    @IBOutlet weak var beforeYearUseGasRyo: UILabel!
    
    //selectedKenshinInput:選択した回分のお客さまをKenshinInputクラスの配列で保持
    var selectedKenshinInput: [KenshinInput] = []
    //selectedNumber:前画面で選択したお客さまの配列番号を保持する変数
    //viewDidLoad()のprint文みたいな方法で検針データを利用可能です
    var selectedNumber:Int = 0

    @IBAction func switchState(_ sender: UISwitch) {
        //回帰あり／なしの表示
        kaikiSwitchState.text = sender.isOn ? "あり":"なし"
    }
//    let tf = UITextField()

    @IBAction func InputEnd(_ sender: Any) {
        print("イベント拾ったよ")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //お客さま情報表示
        //お客さま番号ハイフン編集
        let gmtNum = selectedKenshinInput[selectedNumber].s_GasSecchi.splitInto(1)
        //お客さま番号
        targetNumber.text = gmtNum[0] + gmtNum[1] + gmtNum[2] + gmtNum[3] + "-" + gmtNum[4] + gmtNum[5] + gmtNum[6] + "-" + gmtNum[7] + gmtNum[8] + gmtNum[9] + gmtNum[10]
        //お客さま名
        customName.text = self.selectedKenshinInput[selectedNumber].s_NameJ
        //メータ番号
        meterNumber.text = self.selectedKenshinInput[selectedNumber].s_MeterNo
        
        //前回検針情報
        beforeUseGas.text = self.selectedKenshinInput[selectedNumber].s_OldShiji
        beforeUseGasRyo.text = self.selectedKenshinInput[selectedNumber].s_B1Ryo
        beforeYearUseGasRyo.text = self.selectedKenshinInput[selectedNumber].s_BB1Ryo
 //       tf.delegate = self
        
        //ナビゲーションバーの右側に保存ボタンを表示
        self.navigationItem.setRightBarButton(UIBarButtonItem(title: "保存", style: .plain, target: self, action: #selector(rightBarBtnClicked(sender:))), animated: true)
 
  /*      //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        tf.clearButtonMode = .whileEditing
        //改行ボタン
        tf.returnKeyType = .go
       
        tf.addTarget(self, action: Selector(("textFieldDidChange:")),for: UIControlEvents.editingChanged)
        view.addSubview(tf)
 */
    }
    //画面表示時にテキストへフォーカスし、キーボード表示
    override func viewWillAppear(_ animated: Bool) {
        thisUseGas.becomeFirstResponder()
    }

    private func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        print("キーボードを閉じる前")
        // キーボードを閉じる処理
        self.view.endEditing(true)
        //        rightBarBtnClicked(sender:)
        print("キーボードを閉じたあと")
        return true
    }

    func textFieldShouldEndEditing(_ textField:UITextField) -> Bool {
        print("キーボードを閉じる前")
        let inputData = self.thisUseGas.text
        let minusData = self.beforeUseGas.text!
        thisUseGasRyo.text = String(Int(inputData!)! - Int(minusData)!)

        return true
    }
    
/*
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("テキストフィールがタップされ、入力可能になったあと")
        if thisUseGasRyo.text != nil {
            //今回使用量を計算して表示
            thisUseGasRyo.text = String(Int(beforeUseGas.text!)! - Int(beforeUseGas.text!)!)
        }
    }

    //keyboard以外の画面を押すと、keyboardを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.tf.isFirstResponder) {
            self.tf.resignFirstResponder()
        }
    }

    func textFieldDidChange(textFiled: UITextField) {
        //今回使用量を計算して表示
        thisUseGasRyo.text = String(Int(beforeUseGas.text!)! - Int(beforeUseGas.text!)!)
    }
*/
    @objc func rightBarBtnClicked(sender: UIButton){
        print("保存ボタンが押されたよ");
        //キーボードを閉じる
        view.endEditing(true)
        let inputData = (thisUseGas.text!).trimmingCharacters(in: .whitespaces)
        let minusData = (beforeUseGas.text!).trimmingCharacters(in: .whitespaces)
        //画面に入力された今回指示数から前回指示数を引き算
        if let data1 = Int(inputData){
            if let data2 = Int(minusData){
                thisUseGasRyo.text = String(data1 - data2)
            }
        }
        //確認用のダイアログを表示
        let alert = UIAlertController(title: "使用量確認", message: "今回指示数： \(self.thisUseGas.text!)\n今回使用量： \(self.thisUseGasRyo.text!)\nこの使用量で登録してよろしいですか", preferredStyle: UIAlertControllerStyle.alert)
        
        //OKボタンを表示
        let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
        { action in

            if let tabvc = UIApplication.shared.keyWindow?.rootViewController as? UITabBarController  {
                //左から２番目のタブアイコンを選択状態にする(0が一番左)
                DispatchQueue.main.async {
                    tabvc.selectedIndex = 1
                }
            }
            // 移動先ViewControllerのインスタンスを取得（ストーリーボードIDから）
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "vcAreaSerch")
//            nextView.selectedKenshinInput = self.selectedKenshinInput
//            nextView.selectedNumber = self.selectedNumber + 1;
            self.navigationController?.present(nextView, animated: true, completion: nil)
//            self.present(nextView, animated: true, completion: nil)
        }
        alert.addAction(okButton)
        //キャンセルボタンを表示
        let cancelButton = UIAlertAction(title: "キャンセル", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(cancelButton)
                
        present(alert, animated: true, completion: nil)

    }
/*
    //フォーカスが離れたらキーボードを閉じ、使用量を計算する
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        view.endEditing(true)
        
        if (thisUseGas?.text) == nil {
            print("ERROR!!")
            //アラートを表示する。
            _ = UIAlertController(title: "使用量", message: "使用量が入力されていません！正しい指示数を入力して下さい。", preferredStyle: UIAlertControllerStyle.alert)
        }
        //今回使用量を計算して表示
        thisUseGasRyo.text = String(Int(beforeUseGas.text!)! - Int(beforeUseGas.text!)!)
        
    }
*/
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 3
        case 1:
            return 3
        case 2:
            return 3
        default:
            return 0
        }
    }
    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //        次の画面を取り出す
        let viewController = segue.destination as! ViewController_KenshinConform
        viewController.selectedKenshinInput = self.selectedKenshinInput
        viewController.selectedNumber = self.selectedNumber;
    }

/*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
*/
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
