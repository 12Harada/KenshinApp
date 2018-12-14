//
//  ViewController_Hello.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/01.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit
import CoreMotion //歩数カウントのため

class ViewController_Hello: UIViewController{
    


    @IBOutlet weak var weatherPoint: UILabel!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabelk: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var step:UILabel!
    
    
    //ログイン管理用変数
    var loginUser = [Login]()
    var weather = [Weather]()
    var motion = [Motion]()
    
    // class wide constant !!
    let pedometer = CMPedometer()
    
    
    
    override func viewDidLoad() {
        
        //motionに初期値を格納
        motion.append(Motion(steps:0,distance:0,period:0,speed:0,averageActivePace:0))
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "haradaImage.png")
        
        // Image Viewに画像を設定
        faceImage.image = image
        faceImage.contentMode = UIViewContentMode.scaleAspectFit
        //枠線を適用。色は黒
        //self.faceImage.layer.borderColor = UIColor.black.cgColor
        //self.faceImage.layer.borderWidth = 3
        
        //角丸を適用
        //self.faceImage.layer.cornerRadius = 80
        
        //角丸に合わせて画像をマスク
        //self.faceImage.layer.masksToBounds = true
        
        //拠点名格納
        baseLabel.text = "東京ガスライフバル目黒"
        
        //ハローメイト名前格納
        nameLabel.text = "原田　弘章"
        
        //ハローメイト名前（カナ）格納
        nameLabelk.text = "ハラダ　ヒロアキ"
        
        
        weatherPoint.text = "目黒区の天気"
        super.viewDidLoad()
        print(weather.count)
        // Do any additional setup after loading the view.
        
        //画面名を変更
        self.navigationItem.title = "ホーム"
        
        // ログイン画面には戻れないようにする
        self.navigationItem.hidesBackButton = true
        
        //前画面からのログインデータ連携確認
        //print("DukeIDの値：" + loginUser.person)
        //print("パスワードの値：" + login.password)
        
        //お知らせ情報
        
        
        /*********************************
         コレクションカスタムビューセル の実装
        *********************************/
        
        collectionView.dataSource = (self as UICollectionViewDataSource)
        
        collectionView.register(UINib(nibName: "WeatherCustomCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCustomCell")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:131, height:100)
       // layout.itemSize = CGSize(width: collectionView.frame.width, height: 20)
        collectionView.collectionViewLayout = layout
        
        
        /**********************************
         万歩計の実装
        **********************************/
        
        // CMPedometerの確認
        if(CMPedometer.isStepCountingAvailable()){
            print("CMPedometerの実行")
            self.pedometer.startUpdates(from: NSDate() as Date) {
                (data: CMPedometerData?, error) -> Void in
                DispatchQueue.main.async(execute: { () -> Void in
                    if(error == nil){
                        // 歩数 NSNumber?
                        let steps = data!.numberOfSteps
                        var results:String = String(format:"歩数: %d", steps.intValue)
                        results += "\n"
                        
                        self.motion[0].steps = steps.intValue
                        
                         // 距離 NSNumber?
                         let distance = data!.distance!.doubleValue
                         results += String(format: "距離: %d", Int(distance))
                         results += "\n"
                        
                        self.motion[0].distance = Int(distance)
                         
                         // 期間
                         let period = data!.endDate.timeIntervalSince(data!.startDate)
                        self.motion[0].period = period
                        
                         // スピード
                         let speed = distance / period
                         results += String(format: "スピード（秒速m/s）: %f", speed)
                         results += "\n"
                        
                        self.motion[0].speed = speed
                         
                         // 平均ペース NSNumber?
                         let averageActivePace = data!.averageActivePace
                         results += String(format: "平均ペース: %f", averageActivePace!.doubleValue)
                         results += "\n"
                        
                        self.motion[0].averageActivePace = averageActivePace!.doubleValue
                         /*
                         // ペース NSNumber?
                         let currentPace = data!.currentPace
                         results += String(format: "currentPace: %f", currentPace!.doubleValue)
                         results += "\n"
                         
                         // リズム steps/second NSNumber?
                         let currentCadence = data!.currentCadence
                         results += String(format: "currentCadence: %f", currentCadence!.doubleValue)
                         results += "\n"
                         
                         // 昇ったフロアの数 NSNumber?
                         let floorsAscended = data!.floorsAscended
                         results += String(format: "floorsAscended: %d", floorsAscended!.intValue)
                         results += "\n"
                         
                         // 降りたフロアの数 NSNumber?
                         let floorsDescended = data!.floorsDescended
                         results += String(format: "floorsDescended: %d", floorsDescended!.intValue)
                         results += "\n"
                         */
                        // ライン数
                        self.step.numberOfLines = 20
                        
                        self.step.text = results
                        
                    }
                    
                })
            }
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
    /*********************************
     コレクションカスタムビューセル の実装
     *********************************/

   //表示させるセルの数を返却
   //LivedoorWeatherが時間帯によっては明後日の天気を取得できない場合があるため、返却値は2 or 3となる
    extension ViewController_Hello: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return weather.count
        }
        //
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCustomCell", for: indexPath)
            
            if let cell = cell as? WeatherCustomCell {
                cell.setupCell(model: weather[indexPath.row])
            }
            cell.contentView.layer.borderColor = UIColor.blue.cgColor // 枠線の色を青に
            cell.contentView.layer.borderWidth = 0.5
            
            return cell
        }
    }
