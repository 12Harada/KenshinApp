//
//  WeatherCustomCell.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/17.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class WeatherCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Maxt: UILabel!
    @IBOutlet weak var Mint: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    
    func setupCell(model: Weather) {
        
        print("model.dateの値")
        print(model.date)
        print("最高気温の値")
        print(model.maxTemperatureCcelsius)
        print("最低気温の値")
        print(model.minTemperatureCcelsius)
        
        let str1:String = model.date
        //2018年が不要のため末尾5文字だけを格納
        Date.text = str1.substring(from: str1.index(str1.endIndex, offsetBy: -5))
        
        //最高気温、最低気温を格納
        Maxt.text? = model.maxTemperatureCcelsius
        Mint.text? = model.minTemperatureCcelsius
        
        //画像表示
        let url = URL(string: model.url)!
        let imageData = try? Data(contentsOf: url)
        
        let image = UIImage(data:imageData!)
        weatherImage.image = image
        
     //   self.backgroundColor = .lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        Date.text = ""
        Maxt.text = ""
        Mint.text = ""
    }
}
