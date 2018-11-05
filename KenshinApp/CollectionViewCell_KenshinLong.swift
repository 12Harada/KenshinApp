//
//  CollectionViewCell_KenshinLong.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/18.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class CollectionViewCell_KenshinLong: UICollectionViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func setupCell(model: MenuCell) {
        //タイトル表示
        title.text = model.title
        
        //画像表示
        let image = UIImage(named:model.titleImage)
        titleImage.image = image
        
        
        // RGBA; red: 赤, green: 緑, blue: 青, a: 透明度
        let rgba = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
        self.backgroundColor = rgba
    }

}
