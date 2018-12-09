//
//  CommonFunc.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/11.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

extension String {
    func splitInto(_ length: Int) -> [String] {
        var str = self
        for i in 0 ..< (str.count - 1) / max(length, 1) {
            str.insert(",", at: str.index(str.startIndex, offsetBy: (i + 1) * max(length, 1) + i))
        }
        return str.components(separatedBy: ",")
    }
}

/* 長押しした際に呼ばれるメソッド */
func cellLongPressed(longPressGestureRecognizer: UILongPressGestureRecognizer){
    print("ロングプレス実行")
    
    if longPressGestureRecognizer.state == .began {
        print("long press began")
    }
    if longPressGestureRecognizer.state == .ended {
        print("long press ended")
    }
}
