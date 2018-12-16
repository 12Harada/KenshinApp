//
//  Motion.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/12/14.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation

class Motion: Codable{
    /*
    //歩数
    var steps: Int
    //距離
    var distance: Int
    
    //期間
    var period: TimeInterval
    
    // スピード
    var speed: Double
    
    // 平均ペース NSNumber?
    var averageActivePace: Double
    
    
    init(steps: Int, distance: Int, period: TimeInterval, speed:Double, averageActivePace:Double){
        self.steps = steps
        self.distance = distance
        self.period = period
        self.speed = speed
        self.averageActivePace = averageActivePace
    }*/
    
    //項目名
    var healthName: String
    
    //項目値(Int)
    var healthValue1: Int
    
    //項目値(Double)
    var healthValue2: Double
    
    //項目値（TimeInterval)
    var healthValue3: TimeInterval
    
    init(healthName: String, healthValue1: Int, healthValue2: Double, healthValue3: TimeInterval){
        self.healthName = healthName
        self.healthValue1 = healthValue1
        self.healthValue2 = healthValue2
        self.healthValue3 = healthValue3
        
    }
    
    
}
