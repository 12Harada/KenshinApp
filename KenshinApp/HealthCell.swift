//
//  HealthCell.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/15.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import UIKit

class HealthCell: UITableViewCell {
    @IBOutlet weak var healthImage: UIImageView!
    @IBOutlet weak var healthName: UILabel!
    @IBOutlet weak var healthValue1: UILabel!
    @IBOutlet weak var healthValue2: UILabel!
    
    var image3 = UIImage(named:"secret.png")
    
    func setupCell(model:Motion ) {
        //顔写真
       
        //healthImage.image = image3
        //faceImage.contentMode = UIViewContentMode.scaleAspectFill
        
        //項目名
        healthName.text = model.healthName
        
        //項目値1
        healthValue1.text = String(model.healthValue1)
        
        //項目値2
        //mをKmに変換
        healthValue2.text = String(model.healthValue2)
        
        //画像
        if(model.healthName == "歩数"){
            image3 = UIImage(named:"walking.png")
            healthValue1.text = String(model.healthValue1) + " 歩"
            healthValue2.alpha = 0
        }else if(model.healthName == "距離"){
            image3 = UIImage(named:"distance.png")
            healthValue1.text = String(model.healthValue1) + " m"
            healthValue2.alpha = 0
        }else{
            image3 = UIImage(named:"ave_speed.png")
            healthValue2.text = String(model.healthValue2) + " Km/時"
            healthValue1.alpha = 0
        }
        healthImage.image = image3
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
