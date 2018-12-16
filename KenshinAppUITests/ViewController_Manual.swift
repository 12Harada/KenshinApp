//
//  ViewController_Manual.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/16.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit
import PDFKit

class ViewController_Manual: UIViewController{
    
    @IBOutlet var pdfView: PDFView!
    var manualNo:Int = 0
    var manualName:String = ""
    
    var pdfURL = URL(fileURLWithPath: "path")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = manualName
        
        print("manualNo:",manualNo)
        // PDFDocument
        if(manualNo == 0){
            guard let path = Bundle.main.path(forResource: "FCUnit", ofType: "pdf") else {
                print("failed to get path.")
                return
            }
            pdfURL = URL(fileURLWithPath: path)
        }else if(manualNo == 1){
            guard let path = Bundle.main.path(forResource: "FanHeater", ofType: "pdf") else {
                print("failed to get path.")
                return
            }
            pdfURL = URL(fileURLWithPath: path)
        }else if(manualNo == 2){
            guard let path = Bundle.main.path(forResource: "yuwakashi", ofType: "pdf") else {
                print("failed to get path.")
                return
            }
            pdfURL = URL(fileURLWithPath: path)
        }
        
        
        guard let document = PDFDocument(url: pdfURL) else { return }
        
        // PDFView
        pdfView = PDFView(frame: view.frame) // UIViewController.view の大きさで生成 pdfView は ViewController のプロパティ
        pdfView?.document = document
        pdfView?.backgroundColor = .lightGray
        pdfView?.autoScales = true
        pdfView?.displayMode = .singlePageContinuous
        
        view.addSubview(pdfView!)
    }
    
    
    
}
