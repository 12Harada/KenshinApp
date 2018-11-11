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
    
    //即検針年月日　西暦
    let s_SokuDate:String
    
    //料金発生年月日　和暦
    let s_HasseiDate:String
    
    //熱量コード
    let s_NetsuCd:String
    
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
    
    //ＧＨＰメータ設置コード
    let s_GhpCd:String
    
    //検針方法コード
    let s_HohoCd:String
    
    //グループ検針順序番号
    let s_GkenSeq:String
    
    //検針順序番号
    let s_KenSeq:String
    
    //屋外犬数
    let s_Odog:String
    
    //屋内犬数
    let s_Idog:String
    
    //屋外犬分類コード
    let s_ODogCd:String
    
    //屋内犬分類コード
    let s_IDogCd:String
    
    //次回検針予定年月日
    let s_NextDate:String
    
    //閉栓期間
    let s_HeiKikan:String
    
    //社番番号
    let s_MeterNo:String
    
    //連続推定回数
    let s_SuiKaisu:String
    
    //ガスメータ号数流量
    let s_MeterGou:String
    
    //ガスメータ形式記号
    let s_MeterKata:String
    
    //指示数表示桁数
    let s_MeterKeta:String
    
    //社用コード
    let s_SyayoCd:String
    
    //定例訪問検針回分番号
    let s_TeiHomon:String
    
    //定例電話検針回分番号
    let s_TeiTel:String
    
    //指定検針回分番号
    let s_ShiteiKai:String
    
    //指定検針日コード
    let s_ShiteiCd:String
    
    //請求サービスコード
    let s_SeikyuScd:String
    
    //お客さま電話番号
    let s_TelNo:String
    
    //総合コード
    let s_SougouCd:String
    
    //丁目−番地−号（１）
    let s_Adrs1:String
    
    //丁目−番地−号（２）
    let s_Adrs2:String
    
    //丁目−番地−号（３）
    let s_Adrs3:String
    
    //アパート名・部屋番号等カナ
    let s_AptMeiC1:String
    
    //建物名カナ
    let s_AptC:String
    
    //建物名漢字
    let s_AptJ:String
    
    //建物漢字表示可否コード
    let s_AptCJCd:String
    
    //棟番カナ
    let s_AptMeiC2:String
    
    //部屋番カナ
    let s_AptMeiC3:String
    
    //店名・屋号漢字
    let s_YagoJ:String
    
    //店名・屋号カナ
    let s_YagoC:String
    
    //店名屋号法人種別コード
    let s_YagoHjnSyu:String
    
    //店名屋号法人表示位置コード
    let s_YagoHjnIchi:String
    
    //検針票表示名漢字
    let s_NameJ:String
    
    //法人種別コード
    let s_HjnSyu:String
    
    //法人表示位置コード
    let s_HjnIchi:String
    
    //ガス料金支払い方法コード
    let s_ShiharaiCd:String
    
    //前回ガスメータ指示数
    let s_OldShiji:String
    
    //旧メータ取外指示数
    let s_KyuShiji:String
    
    //旧メータ使用量
    let s_KyuShiyou:String
    
    //前回使用日数
    let s_B1Kikan:String
    
    //前回使用量
    let s_B1Ryo:String
    
    //前年前回使用日数
    let s_BB2Kikan:String
    
    //前年前回使用量
    let s_BB2Ryo:String
    
    //前年同回使用日数
    let s_BB1Kikan:String
    
    //前年同回使用量
    let s_BB1Ryo:String
    
    //前年前々回使用日数
    let s_BB3Kikan:String
    
    //前年前々回使用量
    let s_BB3Ryo:String
    
    //無線有無コード
    let s_MusenFlg:String
    
    //負荷記録計有無コード
    let s_HukaUmuCd:String
    
    //お客さま電話番号
    let s_CustTelNo:String
    
    //開栓年月日
    let s_KaiSenDate:String
    
    //電気検針日
    let s_ElectricDate:String
    
    //電気契約有無コード
    let s_ElectricKeiyakuFlag:String
    
    //検針票郵送先設定有無コード
    let s_YusoSetteiCode:String
    
    //ガスメータ指示数今回
    let s_Shiji:String
    
    //ガス使用量今回
    let s_ShiyouRyo:String
    
    //検針担当社員番号
    let s_TantoCd:String
    
    //指示数回帰コード
    let s_KaikiCd:String
    
    init(s_GasSecchi:String,s_TeireiDate:String,s_SokuDate:String,s_HasseiDate:String,s_NetsuCd:String,s_YotoCd:String,s_GyoseiCd:String,s_GouBan:String,s_IchiCd:String,s_KeiyakuType:String,s_UseCd:String,s_GhpCd:String,s_HohoCd:String,s_GkenSeq:String,s_KenSeq:String,s_Odog:String,s_Idog:String,s_ODogCd:String,s_IDogCd:String,s_NextDate:String,s_HeiKikan:String,s_MeterNo:String,s_SuiKaisu:String,s_MeterGou:String,s_MeterKata:String,s_MeterKeta:String,s_SyayoCd:String,s_TeiHomon:String,s_TeiTel:String,s_ShiteiKai:String,s_ShiteiCd:String,s_SeikyuScd:String,s_TelNo:String,s_SougouCd:String,s_Adrs1:String,s_Adrs2:String,s_Adrs3:String,s_AptMeiC1:String,s_AptC:String,s_AptJ:String,s_AptCJCd:String,s_AptMeiC2:String,s_AptMeiC3:String,s_YagoJ:String,s_YagoC:String,s_YagoHjnSyu:String,s_YagoHjnIchi:String,s_NameJ:String,s_HjnSyu:String,s_HjnIchi:String,s_ShiharaiCd:String,s_OldShiji:String,s_KyuShiji:String,s_KyuShiyou:String,s_B1Kikan:String,s_B1Ryo:String,s_BB2Kikan:String,s_BB2Ryo:String,s_BB1Kikan:String,s_BB1Ryo:String,s_BB3Kikan:String,s_BB3Ryo:String,s_MusenFlg:String,s_HukaUmuCd:String,s_CustTelNo:String,s_KaiSenDate:String,s_ElectricDate:String,s_ElectricKeiyakuFlag:String,s_YusoSetteiCode:String,s_Shiji:String,s_ShiyouRyo:String,s_TantoCd:String,s_KaikiCd:String){
        
        self.s_GasSecchi = s_GasSecchi
        self.s_TeireiDate = s_TeireiDate
        self.s_SokuDate = s_SokuDate
        self.s_HasseiDate = s_HasseiDate
        self.s_NetsuCd = s_NetsuCd
        self.s_YotoCd = s_YotoCd
        self.s_GyoseiCd = s_GyoseiCd
        self.s_GouBan = s_GouBan
        self.s_IchiCd = s_IchiCd
        self.s_KeiyakuType = s_KeiyakuType
        self.s_UseCd = s_UseCd
        self.s_GhpCd = s_GhpCd
        self.s_HohoCd = s_HohoCd
        self.s_GkenSeq = s_GkenSeq
        self.s_KenSeq = s_KenSeq
        self.s_Odog = s_Odog
        self.s_Idog = s_Idog
        self.s_ODogCd = s_ODogCd
        self.s_IDogCd = s_IDogCd
        self.s_NextDate = s_NextDate
        self.s_HeiKikan = s_HeiKikan
        self.s_MeterNo = s_MeterNo
        self.s_SuiKaisu = s_SuiKaisu
        self.s_MeterGou = s_MeterGou
        self.s_MeterKata = s_MeterKata
        self.s_MeterKeta = s_MeterKeta
        self.s_SyayoCd = s_SyayoCd
        self.s_TeiHomon = s_TeiHomon
        self.s_TeiTel = s_TeiTel
        self.s_ShiteiKai = s_ShiteiKai
        self.s_ShiteiCd = s_ShiteiCd
        self.s_SeikyuScd = s_SeikyuScd
        self.s_TelNo = s_TelNo
        self.s_SougouCd = s_SougouCd
        self.s_Adrs1 = s_Adrs1
        self.s_Adrs2 = s_Adrs2
        self.s_Adrs3 = s_Adrs3
        self.s_AptMeiC1 = s_AptMeiC1
        self.s_AptC = s_AptC
        self.s_AptJ = s_AptJ
        self.s_AptCJCd = s_AptCJCd
        self.s_AptMeiC2 = s_AptMeiC2
        self.s_AptMeiC3 = s_AptMeiC3
        self.s_YagoJ = s_YagoJ
        self.s_YagoC = s_YagoC
        self.s_YagoHjnSyu = s_YagoHjnSyu
        self.s_YagoHjnIchi = s_YagoHjnIchi
        self.s_NameJ = s_NameJ
        self.s_HjnSyu = s_HjnSyu
        self.s_HjnIchi = s_HjnIchi
        self.s_ShiharaiCd = s_ShiharaiCd
        self.s_OldShiji = s_OldShiji
        self.s_KyuShiji = s_KyuShiji
        self.s_KyuShiyou = s_KyuShiyou
        self.s_B1Kikan = s_B1Kikan
        self.s_B1Ryo = s_B1Ryo
        self.s_BB2Kikan = s_BB2Kikan
        self.s_BB2Ryo = s_BB2Ryo
        self.s_BB1Kikan = s_BB1Kikan
        self.s_BB1Ryo = s_BB1Ryo
        self.s_BB3Kikan = s_BB3Kikan
        self.s_BB3Ryo = s_BB3Ryo
        self.s_MusenFlg = s_MusenFlg
        self.s_HukaUmuCd = s_HukaUmuCd
        self.s_CustTelNo = s_CustTelNo
        self.s_KaiSenDate = s_KaiSenDate
        self.s_ElectricDate = s_ElectricDate
        self.s_ElectricKeiyakuFlag = s_ElectricKeiyakuFlag
        self.s_YusoSetteiCode = s_YusoSetteiCode
        self.s_Shiji = s_Shiji
        self.s_ShiyouRyo = s_ShiyouRyo
        self.s_TantoCd = s_TantoCd
        self.s_KaikiCd = s_KaikiCd
    }
    
}
