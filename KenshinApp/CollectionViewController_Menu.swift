//
//  CollectionViewController_Menu.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/02.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

//コレクションビューに画像を貼り付ける
//https://i-app-tec.com/ios/collectionview.html

import UIKit

struct MenuCell {
    var titleImage: String
    var title: String
    
    init(titleImage: String, title: String) {
        self.titleImage = titleImage
        self.title = title
    }
}


class CollectionViewController_Menu: UICollectionViewController {

    
    @IBOutlet var collectionKenshinView: UICollectionView!
    /*
    let CollectionViewCell_Kenshin = "CollectionViewCell_Kenshin"
    */
    let menuNames: [String] = ["検針", "当日再配信", "設定", "秘密画面"]

    let nextScreen: [String] = ["TabMenuSegue","TabMenuSegue","TabMenuSegue","TabMenuSegue"]
 
    
    
    
    // サムネイル画像の名前
    let photos = ["meter.png", "repeat.png","gear.png","secret.png"]
    
    var menuCell = [MenuCell]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /************************
         カスタムセル
        ************************/
        
        
        for i in 0..<4 {
            menuCell.append(MenuCell(titleImage:photos[i],title:menuNames[i]))
        }
        
        collectionKenshinView.dataSource = self

        //カスタムセルを利用するためにビューに登録
        collectionKenshinView.register(UINib(nibName: "CollectionViewCell_KenshinLong", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell_KenshinLong")
        collectionKenshinView.register(UINib(nibName: "CollectionViewCell_Kenshin", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell_Kenshin")
        
        // セルの大きさを設定
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width:150, height:150)
        // layout.itemSize = CGSize(width: collectionView.frame.width, height: 20)
        collectionView?.collectionViewLayout = layout
        
        

        // Uncomment the following line to preserve selection between presentations
        collectionKenshinView.dataSource = self
        collectionKenshinView.delegate = self
        collectionKenshinView.allowsSelection = true // 選択可能にする
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4 // itemsの個数だけセルを表示する
        }
    
    //cellがタップされた時
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //xibカスタムセル設定によりsegueが無効になっているためsegueを発生させる
        self.performSegue(withIdentifier: "TabMenuSegue", sender: self.tableView)
        
    }
    
    // Cell が選択された場合
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        // ViewController へ遷移するために Segue を呼び出し
        performSegue(withIdentifier: nextScreen[indexPath.row],sender: nil)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*********************************
     コレクションカスタムビューセル の実装
     *********************************/
    //
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_KenshinLong", for: indexPath)
        
            if let cell = cell as? CollectionViewCell_KenshinLong {
                cell.setupCell(model: menuCell[indexPath.row])
        cell.contentView.layer.borderColor = UIColor.blue.cgColor // 枠線の色を青に
        cell.contentView.layer.borderWidth = 0.5
            
        // RGBA; red: 赤, green: 緑, blue: 青, a: 透明度
        //セルによって色を変える
                switch indexPath.row{
                case 0:
                    let rgba = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
                    cell.backgroundColor = rgba
                    
                    //let rgba2 = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
                    //cell.title.backgroundColor = rgba2
                    
                case 1:
                    let rgba = UIColor.init(red: 39/255, green: 69/255, blue: 132/255, alpha: 80/100)
                    cell.backgroundColor = rgba
                    
                    //let rgba2 = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
                    //cell.title.backgroundColor = rgba2
                    
                case 2:
                    let rgba = UIColor.init(red: 19/255, green: 49/255, blue: 112/255, alpha: 70/100)
                    cell.backgroundColor = rgba
                    
                    //let rgba2 = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
                    //cell.title.backgroundColor = rgba2
                    
                case 3:
                    let rgba = UIColor.init(red: 0/255, green: 29/255, blue: 92/255, alpha: 60/100)
                    cell.backgroundColor = rgba
                    
                    //let rgba2 = UIColor.init(red: 59/255, green: 89/255, blue: 152/255, alpha: 90/100)
                    //cell.title.backgroundColor = rgba2
                    
                default:
                    print("ここには来ないはず")
                }
        }
        return cell
            
      /*  }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell_Kenshin", for: indexPath)
            
            if let cell = cell as? CollectionViewCell_Kenshin {
                cell.setupCell(model: menuCell[indexPath.row])
            }
            cell.contentView.layer.borderColor = UIColor.blue.cgColor // 枠線の色を青に
            cell.contentView.layer.borderWidth = 0.5
 
            return cell
        }*/
    }
}

extension CollectionViewController_Menu: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        //画面の表示領域を取得（CGFloat型）
        let screenWidth = UIScreen.main.bounds.size.width

        
       /* let oddEven = indexPath.row % 2
        let width: Int
        
        if oddEven == 0 {
            width = 100
        } else {
            width = 50
        }*/
        
        let width: Int
        let height: Int
      //  if (indexPath.row == 0){
            width = Int(screenWidth) //CGFloat型からInt型に型変換
            print("width")
            print(width)
            height = 150
       /* }else{
            width = 130
            height = 130
        }*/
        
        
        
        return CGSize(width: width, height: height)
    }
}








