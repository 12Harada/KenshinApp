//
//  PrimaryActionButton.swift
//  KenshinApp
//
//  Created by M_HASHIZUME on 2018/11/06.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class PrimaryActionButton: UIButton {

  private func configure(){
    backgroundColor = UIColor.darkGray
    layer.cornerRadius = 24
    titleLabel?.font = UIFont.boldSystemFont(ofSize:44)
    setTitleColor(UIColor.white, for: .normal)
    
    layer.shadowOpacity = 0.3
    layer.shadowOffset = CGSize(width: 0, height: 1)
    layer.shadowRadius = 4
    layer.shadowColor = UIColor.gray.cgColor
  }
  
  public override var intrinsicContentSize: CGSize {
    var size = super.intrinsicContentSize
    size.height = 48
    
    if let titleLabel = titleLabel {
      size.width = titleLabel.intrinsicContentSize.width + 48
    }
    
    return size
  }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
