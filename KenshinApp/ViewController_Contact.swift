//
//  ViewController_Contact.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/11.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit

class ViewController_Contact: UIViewController, UITableViewDelegate, UITableViewDataSource{ //追加①
    
    let TODO = ["牛乳を買う", "掃除をする", "アプリ開発の勉強をする"] //追加②
    
    var contact: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var str = ""
        
        let documentsPath = NSHomeDirectory() + "/Documents"
        
        let st1 = documentsPath + "/Contact.json"
        let importURL:URL = URL(fileURLWithPath: st1)
        //GohInfoのJsonファイル取得
        do {
            print("jsonファイルをstrに格納")
            str = try String( contentsOf: importURL, encoding: String.Encoding.utf8 )
            // print(str)
        } catch {
            print(error)
        }
        let lecturerData: Data = str.data(using: .utf8)!
        
        //デコードContact
        let decoder: JSONDecoder = JSONDecoder()
        do {
            contact = try decoder.decode([Contact].self, from: lecturerData)
        }catch{
            print("decode error")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TODO.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = contact[indexPath.row].name
        return cell
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("Cell選択処理実行")
        // 選択した列を変数に格納。格納する際にInt型をString型に型変換
        let tmpText = "tel://"
        
        let tmpText1 = tmpText + contact[indexPath.count].telNum
        let url = NSURL(string: tmpText1)!

        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url as URL)
        } else {
            UIApplication.shared.openURL(url as URL)
        }
    }
}
