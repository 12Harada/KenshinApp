//
//  triangleButton.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/19.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit

class TriangleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawTriangle()
    }
    
    private func drawTriangle() {
        let path = createTrianglePath()
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        self.layer.masksToBounds = true
        self.layer.mask = mask
        
        // RGBA; red: 赤, green: 緑, blue: 青, a: 透明度
        //ボタンのボーダーカラーにはCGColorは使えるが、UIColorは使えないため変換
        let rgba = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100).cgColor
        
        let borderShape = CAShapeLayer()
        borderShape.path = path.cgPath
        borderShape.lineWidth = 4.0
        borderShape.strokeColor = rgba
        
        borderShape.fillColor = rgba
        self.layer.insertSublayer(borderShape, at: 0)
    }
    
    private func createTrianglePath() -> UIBezierPath {
        let rect = self.frame
        let path = UIBezierPath()
        //path.move(to: CGPoint(x:rect.width, y:0))
        path.move(to: CGPoint(x:0, y:0))
        path.addLine(to: CGPoint(x:rect.width, y:rect.height/2))
        path.addLine(to: CGPoint(x:0, y:rect.height))
        path.close()
        return path
    }
}
