//
//  kenshinCustomCell.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/11/20.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class kenshinCustomCell: UITableViewCell {

 
    @IBOutlet weak var thisSiyoRyo: UILabel!
    @IBOutlet weak var txtThisUseRyo: UITextField!

    func setupCell(lblName: String) {
        
        thisSiyoRyo.font = UIFont.systemFont(ofSize: 14)
        thisSiyoRyo.text = lblName
        txtThisUseRyo.font = UIFont.systemFont(ofSize: 24)
        
    }


}
