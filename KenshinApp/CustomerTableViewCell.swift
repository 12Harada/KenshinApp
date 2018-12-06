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
        
        //用途コード画像貼り付け
        if(model.s_YotoCd == "13000"){
            image = UIImage(named:"YOTO_HOME_48.png")
        }else{
            print("用途コード想定外")
        }        
        GMTImage.image = image
        GMTImage.contentMode = UIViewContentMode.scaleAspectFill
        
        
    }
    
}
