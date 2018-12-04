//
//  ViewController_Hello.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/01.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit

class ViewController_Hello: UIViewController{
    

    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var weatherPoint: UILabel!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var baseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameLabelk: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var infoMessage: UILabel!
    
    
    //ログイン管理用変数
    let loginUser = [Login]()
    var weather = [Weather]()
    
    
    
    override func viewDidLoad() {
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: "paccho1.jpg")
        
        // Image Viewに画像を設定
        faceImage.image = image
        faceImage.contentMode = UIViewContentMode.scaleAspectFit
        //枠線を適用。色は黒
        self.faceImage.layer.borderColor = UIColor.black.cgColor
        self.faceImage.layer.borderWidth = 3
        
        //角丸を適用
        self.faceImage.layer.cornerRadius = 50
        
        //角丸に合わせて画像をマスク
        self.faceImage.layer.masksToBounds = true
        
        //拠点名格納
        baseLabel.text = "東京ガスライフバル千代田中央"
        
        //ハローメイト名前格納
        nameLabel.text = "山田　太郎"
        
        //ハローメイト名前（カナ）格納
        nameLabelk.text = "ヤマダ　タロウ"
        
        
        weatherPoint.text = "千代田中央の天気"
        super.viewDidLoad()
        print(weather.count)
        // Do any additional setup after loading the view.
        
        //画面名を変更
        self.navigationItem.title = "Infomation"
        
        // ログイン画面には戻れないようにする
        self.navigationItem.hidesBackButton = true
        
        //前画面からのログインデータ連携確認
        //print("DukeIDの値：" + loginUser.person)
        //print("パスワードの値：" + login.password)
        
        //お知らせ情報
        infoMessage.text = "ここにシステム側からのお知らせを記載したい"
        infoMessage.layer.borderColor = UIColor.blue.cgColor
        infoMessage.layer.borderWidth = 0.5
        
        
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
