//
//  ContactClass.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/11.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation

class Contact: Codable {
    
    //担当者名
    let name: String
    //電話番号
    let telNum: String
    //当日検針件数
    let todayNum: String
    //検針済件数
    let doneNum: String
    
    init(name: String, telNum: String,todayNum:String,doneNum:String){
        self.name = name
        self.telNum = telNum
        self.todayNum = todayNum
        self.doneNum = doneNum
    }
    
}

