//
//  ViewController_config.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/16.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import UIKit
import Foundation
//import PDFKit

class ViewController_config: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var manualNo:Int = 0
    var manualName:String = ""
  
    @IBOutlet weak var manualTable: UITableView!
    let prefectures = ["ＦＣユニット（発電継続あり）ＰＳ本店ＰＢ", "ファンヒーター２０号スタンダード県", "小型湯沸器高温型"]
    
    
    //@IBOutlet var pdfView: PDFView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        // PDFDocument
        guard let path = Bundle.main.path(forResource: "FCUnit", ofType: "pdf") else {
            print("failed to get path.")
            return
        }
        let pdfURL = URL(fileURLWithPath: path)
        guard let document = PDFDocument(url: pdfURL) else { return }
        
        // PDFView
        pdfView = PDFView(frame: view.frame) // UIViewController.view の大きさで生成 pdfView は ViewController のプロパティ
        pdfView?.document = document
        pdfView?.backgroundColor = .lightGray
        pdfView?.autoScales = true
        pdfView?.displayMode = .singlePageContinuous
        
        view.addSubview(pdfView!)
        
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // TableViewに表示するセルの数を返却します。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return prefectures.count
    }
    
    // 各セルを生成して返却します。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "manualCell")
        cell.textLabel?.text = self.prefectures[indexPath.row]
        return cell
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("Cell選択処理実行")
        manualNo = indexPath.row
        performSegue(withIdentifier: "manualSegue",sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "manualSegue" {
            let ViewController_Manual = segue.destination as! ViewController_Manual
            ViewController_Manual.manualNo = manualNo
            ViewController_Manual.manualName = self.prefectures[manualNo]
        }
    }
}
