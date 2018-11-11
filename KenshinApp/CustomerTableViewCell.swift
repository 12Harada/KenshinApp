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
    
    func setupCell(model:KenshinInput ) {
        //タイトル表示
        gmtsetNumber.text = model.s_GasSecchi
        
        //お客さま名表示
        customerName.text = model.s_NameJ
        
        //用途コード画像貼り付け
        let image = UIImage(named:"secret.png")
        GMTImage.image = image
        GMTImage.contentMode = UIViewContentMode.scaleAspectFill
    }
    
}
