//
//  kenshinCustomCellKaiki.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/11/28.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class kenshinCustomCellKaiki: UITableViewCell {

    @IBOutlet weak var kaikiMark: UILabel!
    @IBOutlet weak var kaikiSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(lblName: String) {
        
        kaikiMark.font = UIFont.systemFont(ofSize: 14)
        kaikiMark.text = lblName
    }

}
