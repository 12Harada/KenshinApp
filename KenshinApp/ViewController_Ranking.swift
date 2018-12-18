//
//  ViewController_Ra mj g.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/14.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit

class ViewController_Ranking: UIViewController {
    
    var motion = [Motion]()
    
    @IBOutlet weak var rankImage: UIImageView!
    
    
    override func viewDidLoad() {
    self.navigationItem.title = "ランキング"
    
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "ranking2.png")
        
        // Image Viewに画像を設定
        rankImage.image = image
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
