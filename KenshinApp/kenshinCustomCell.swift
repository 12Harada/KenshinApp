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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
