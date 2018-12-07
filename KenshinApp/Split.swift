//
//  Split.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/07.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation

extension String {
    func splitInto(_ length: Int) -> [String] {
        var str = self
        for i in 0 ..< (str.count - 1) / max(length, 1) {
            str.insert(",", at: str.index(str.startIndex, offsetBy: (i + 1) * max(length, 1) + i))
        }
        return str.components(separatedBy: ",")
    }
}
