//
//  ContactCell.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/09.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var expectedNumber: UILabel!
    @IBOutlet weak var completeNumber: UILabel!
    
    var image3 = UIImage(named:"secret.png")
    
    func setupCell(model:Contact ) {
        //顔写真
        if(model.telNum == "08084006082"){//原田
            image3 = UIImage(named:"haradaImage2.png")
        }else if(model.telNum == "08021578366"){//橋爪
            image3 = UIImage(named:"yokomizuImage.png")
        }else if(model.telNum == "08021576528"){//野中
            image3 = UIImage(named:"nonakaImage.png")
        }else{
            image3 = UIImage(named:"secret.png")
        }
        faceImage.image = image3
        //faceImage.contentMode = UIViewContentMode.scaleAspectFill
        
        //名前
        name.text = model.name
        expectedNumber.text = model.todayNum
        completeNumber.text = model.doneNum
        
    }
    
}

