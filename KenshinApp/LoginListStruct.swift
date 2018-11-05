//
//  LoginListStruct.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/09/25.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation

struct LoginList: Codable {
    let person: String
    let password: String
    
    init(person: String, password: String){
        self.person = person
        self.password = password
    }
}
