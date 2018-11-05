//
//  KenshinDataInput.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/07.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation

class KenshinInput: Codable {
    //ガスメータ設置場所番号
    let s_GasSecchi:String
    //定例検針回分年月日
    let s_TeireiDate:String
    //即検診年月日　西暦
    let s_SokuDate:String
    //料金発生年月日　和暦
    let s_HasseiDate:String
    //用途コード
    let s_YotoCd:String
    //行政区画コード
    let s_GyoseiCd:String
    //号番号
    let s_GouBan:String
    //ガスメータ取付位置コード
    let s_IchiCd:String
    //ガス料金契約種別コード
    let s_KeiyakuType:String
    //ガスメータ開閉栓状態コード
    let s_UseCd:String
    //グループ検針順序番号
    let s_GkenSeq:String
    //検針順序番号
    let s_KenSeq:String
    //屋外犬数
    let s_Odog:String
    //屋内犬数
    let s_Idog:String
    //屋内犬分類コード
    let s_ODogCd:String
    //屋外犬分類コード
    let s_IDogCd:String
    //請求サービスコード
    let s_SeikyuScd:String
    //お客さま電話番号
    let s_TelNo:String
    //総合コード
    let s_SougouCd:String
    //丁目ー番地ー号（１）
    let s_Adrs1:String
    //丁目ー番地ー号（２）
    let s_Adrs2:String
    //丁目ー番地ー号（３）
    let s_Adrs3:String
    //アパート名・部屋番号等カナ
    let s_AptMeiC1:String
    //建物名漢字
    let s_AptJ:String
    //棟番カナ
    let s_AptMeiC2:String
    //部屋番カナ
    let s_AptMeiC3:String
    //検針票表示名漢字
    let s_NameJ:String
    //ガス料金支払い方法コード
    let s_ShiharaiCd:String
    //前回使用日数
    let s_B1Kikan:String
    //前回使用量
    let s_B1Ryo:String
    //前年前回使用日数
    let s_BB2Kikan:String
    //前年前回使用量
    let s_BB2Ryo:String
    
    init(s_GasSecchi:String, s_TeireiDate: String,s_SokuDate: String,s_HasseiDate: String,s_YotoCd: String,
         s_GyoseiCd: String,s_GouBan: String, s_IchiCd:String, s_KeiyakuType:String,s_UseCd:String,
         s_GkenSeq: String, s_KenSeq: String, s_Odog: String, s_Idog: String,s_IDogCd: String,
         s_ODogCd: String,s_SeikyuScd: String, s_TelNo: String, s_SougouCd: String,s_Adrs1: String,s_Adrs2: String,
         s_Adrs3: String, s_AptMeiC1:String, s_AptJ:String, s_AptMeiC2: String, s_AptMeiC3: String,
         s_NameJ: String, s_ShiharaiCd: String, s_B1Kikan:String, s_B1Ryo:String, s_BB2Kikan:String,
         s_BB2Ryo: String){
        self.s_GasSecchi = s_GasSecchi
        self.s_TeireiDate = s_TeireiDate
        self.s_SokuDate = s_SokuDate
        self.s_HasseiDate = s_HasseiDate
        self.s_YotoCd = s_YotoCd
        self.s_GyoseiCd = s_GyoseiCd
        self.s_GouBan = s_GouBan
        self.s_IchiCd = s_IchiCd
        self.s_KeiyakuType = s_KeiyakuType
        self.s_UseCd = s_UseCd
        self.s_GkenSeq = s_GkenSeq
        self.s_KenSeq = s_KenSeq
        self.s_Odog = s_Odog
        self.s_Idog = s_Idog
        self.s_ODogCd = s_ODogCd
        self.s_IDogCd = s_IDogCd
        self.s_SeikyuScd = s_SeikyuScd
        self.s_TelNo = s_TelNo
        self.s_SougouCd = s_SougouCd
        self.s_Adrs1 = s_Adrs1
        self.s_Adrs2 = s_Adrs2
        self.s_Adrs3 = s_Adrs3
        self.s_AptMeiC1 = s_AptMeiC1
        self.s_AptJ = s_AptJ
        self.s_AptMeiC2 = s_AptMeiC2
        self.s_AptMeiC3 = s_AptMeiC3
        self.s_NameJ = s_NameJ
        self.s_ShiharaiCd = s_ShiharaiCd
        self.s_B1Kikan = s_B1Kikan
        self.s_B1Ryo = s_B1Ryo
        self.s_BB2Kikan = s_BB2Kikan
        self.s_BB2Ryo = s_BB2Ryo
    }
    
}
