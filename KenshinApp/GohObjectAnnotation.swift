//
//  GohObjectAnnotation.swift
//  KenshinApp
//
//  Created by Harada Hiroaki on 2018/11/11.
//  Copyright © 2018 TomonariNonaka. All rights reserved.
//

import Foundation
import UIKit
import MapKit

//Mapのクラスタリング機能を利用するためのクラスを定義
class GohObjectAnnotation: NSObject, MKAnnotation {
    
    static let clusteringIdentifier = "GohObject"
    
    let coordinate: CLLocationCoordinate2D
    
    let glyphText: String
    
    let glyphTintColor: UIColor
    
    let markerTintColor: UIColor
    
    let title: String?
    
    init(_ coordinate: CLLocationCoordinate2D, glyphText: String, glyphTintColor: UIColor, markerTintColor: UIColor,title:String) {
        self.coordinate = coordinate
        self.glyphText = glyphText
        self.glyphTintColor = glyphTintColor
        self.markerTintColor = markerTintColor
        self.title = title
        

    }
    
}
