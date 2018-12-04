//
//  LoginClass.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/09/25.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation

class Login: Codable{
    //検針担当者ID
    let person: String
    //パスワード
    let password: String
  
    init(person: String, password: String){
      self.person = person
      self.password = password
  }
}
