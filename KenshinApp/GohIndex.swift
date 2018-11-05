//
//  GohIndex.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/07.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation

class Goh: Codable {
    
    //所在地行政区画CD
    //let s_GyoseiCd:String = ""
    let s_GyoseiCd: String
    //号番号
    //let s_GouBan:String = ""
    let s_GouBan: String
    
    //町名・カナ
    //let s_MachiC:String = ""
    let s_MachiC: String
    //町名・漢字
    //let s_MachiJ:String = ""
    let s_MachiJ: String
    //検針回分
    //let s_KaiBun:String = ""
    let s_KaiBun: String
    
    init(s_GyoseiCd: String, s_GouBan: String,s_MachiC:String,s_MachiJ:String,s_KaiBun:String){
        self.s_GyoseiCd = s_GyoseiCd
        self.s_GouBan = s_GouBan
        self.s_MachiC = s_MachiC
        self.s_MachiJ = s_MachiJ
        self.s_KaiBun = s_KaiBun
    }
}
