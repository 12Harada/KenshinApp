//
//  CustomerTableViewCell.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/11.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var GMTImage: UIImageView!
    @IBOutlet weak var gmtsetNumber: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    func setupCell(model:KenshinInput ) {
        //タイトル表示
        gmtsetNumber.text = model.s_GasSecchi
        
        //お客さま名表示
        customerName.text = model.s_NameJ
        
        var image = UIImage(named:"secret.png")
        var image2 = UIImage(named:"Secret.png")
        
        //用途コード画像貼り付け
        if(model.s_YotoCd == "11000"){
            image = UIImage(named:"YOTO_HOME_48.png")
        }else if(model.s_YotoCd == "13000"){
            image = UIImage(named:"YOTO_BUILDING_48.png")
        }else{
            image = UIImage(named:"YOTO_SHOP_48.png")
        }
        GMTImage.image = image
        GMTImage.contentMode = UIViewContentMode.scaleAspectFill
        
        if(model.s_ShiyouRyo != ""){
            print("使用量チェック")
            image2 = UIImage(named:"check.png")
            checkImage.image = image2
            checkImage.contentMode = UIViewContentMode.scaleAspectFill
        }
        
        
    }
    
}
