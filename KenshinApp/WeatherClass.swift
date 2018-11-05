//
//  WeatherClass.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/10/02.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import Foundation

struct Weather {
    var dateLabel: String
    var telop: String
    var date: String
    var minTemperatureCcelsius: String
    var maxTemperatureCcelsius: String
    var url: String
    var title: String
    var width: Int
    var height: Int
    
    init(dateLabel: String, telop: String, date: String, minTemperatureCcelsius: String, maxTemperatureCcelsius: String, url: String, title: String, width: Int, height: Int) {
        self.dateLabel = dateLabel
        self.telop = telop
        self.date = date
        self.minTemperatureCcelsius = minTemperatureCcelsius
        self.maxTemperatureCcelsius = maxTemperatureCcelsius
        self.url = url
        self.title = title
        self.width = width
        self.height = height
    }
}
