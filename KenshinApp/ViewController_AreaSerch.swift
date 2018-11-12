//
//  ViewController_AreaSerch.swift
//
//
//  Created by TomonariNonaka on 2018/09/07.
// サービバーの実装
// https://swiswiswift.com/2017/05/23/uitableviewanduisearchbar/

import UIKit
import MapKit
import CoreLocation


class ViewController_AreaSerch: UIViewController, UITableViewDataSource,UISearchBarDelegate,MKMapViewDelegate {
    
    
    var goh: [Goh] = []
    var kenshinData:[KenshinInput] = []
    var kenshinGoh:[String] = []
    var kenshinGohD:[String] = [] //号の値を格納する配列
    var devideArray:[Int] = [] //kenshinDataの全データからどこが号の区切りなのか格納する配列
    var count:Int = 0
    var i:Int = 0
    var count2:Int = 0
    
    //アノテーションをクラスタリングさせるための変数
    var annotation:[GohObjectAnnotation] = []
    var annotation2:[MKAnnotation] = []
    
    var selectedNumber:Int = 0
    
    //検索結果配列
    var searchResult = [KenshinInput]()

    
    @IBOutlet weak var customerSearchBar: UISearchBar!
    @IBOutlet weak var customerTableView: UITableView!
    @IBOutlet weak var AreaMapView: MKMapView!
    @IBOutlet weak var gohAbb: UILabel! //号の略称を表示する
    @IBOutlet weak var gohName: UILabel!//号の和名を格納する
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.title = "エリア選択"
        
        AreaMapView.delegate = self
        
        
        //カスタムセルを利用するためにビューに登録
        customerTableView.register (UINib(nibName: "CustomerTableViewCell", bundle: nil),forCellReuseIdentifier:"CustomerTableViewCell")

        
        /*************************
         各Json情報の取得
         *************************/
        print("Json情報の取得")
        var str = ""
        // var str2 = ""
        // var str3 = ""
        // var str4 = ""
        var str5 = ""
        
        let documentsPath = NSHomeDirectory() + "/Documents"
        print("ドキュメントパスの値")
        print(documentsPath)
        let st1 = documentsPath + "/GohInfo.json"
        // let st2 = documentsPath + "/KenshinData1.json"
        // let st3 = documentsPath + "/KenshinData2.json"
        // let st4 = documentsPath + "/KenshinData3.json"
        let st5 = documentsPath + "/KenshinData.json"
        
        print(st1)
        let importURL:URL = URL(fileURLWithPath: st1)
        // let importURL2:URL = URL(fileURLWithPath: st2)
        // let importURL3:URL = URL(fileURLWithPath: st3)
        // let importURL4:URL = URL(fileURLWithPath: st4)
        let importURL5:URL = URL(fileURLWithPath: st5)
        
        //GohInfoのJsonファイル取得
        do {
            print("jsonファイルをstrに格納")
            str = try String( contentsOf: importURL, encoding: String.Encoding.utf8 )
            // print(str)
        } catch {
            print(error)
        }
        let lecturerData: Data = str.data(using: .utf8)!
        
        /*
         //KenshinData1のJsonファイル取得
         do {
         print("jsonファイルをstr2に格納")
         str2 = try String( contentsOf: importURL2, encoding: String.Encoding.utf8 )
         //print(str)
         } catch {
         print(error)
         }
         let lecturerData2: Data = str2.data(using: .utf8)!
         
         //KenshinData2のJsonファイル取得
         do {
         print("jsonファイルをstr3に格納")
         str3 = try String( contentsOf: importURL3, encoding: String.Encoding.utf8 )
         //print(str3)
         } catch {
         print(error)
         }
         let lecturerData3: Data = str3.data(using: .utf8)!
         
         //KenshinData3のJsonファイル取得
         do {
         print("jsonファイルをstrに格納")
         str4 = try String( contentsOf: importURL4, encoding: String.Encoding.utf8 )
         //print(str4)
         } catch {
         print(error)
         }
         let lecturerData4: Data = str4.data(using: .utf8)!
         */
        //KenshinDataのJsonファイル取得
        do{
            print("KenshinDataのjsonファイルをstr5に格納")
            str5 = try String( contentsOf: importURL5, encoding: String.Encoding.utf8 )
        } catch{
            print(error)
        }
        let lecturerData5: Data = str5.data(using: .utf8)!
        
        
        //デコードGohInfo
        let decoder: JSONDecoder = JSONDecoder()
        do {
            goh = try decoder.decode([Goh].self, from: lecturerData)
        }catch{
            print("decode error")
        }
        
        /*
         //デコードKenshinData1
         let decoder2: JSONDecoder = JSONDecoder()
         print("KenshinData1デコード開始")
         do {
         kenshinInput1 = try decoder2.decode([KenshinInput].self, from: lecturerData2)
         for w in kenshinInput1 {
         print("お客さま名は" + "\(w.s_NameJ)")
         }
         }catch{
         print("decode error")
         }
         
         //デコードKenshinData2
         let decoder3: JSONDecoder = JSONDecoder()
         do {
         kenshinInput2 = try decoder3.decode([KenshinInput].self, from: lecturerData3)
         for w in kenshinInput2 {
         print("お客さま名は" + "\(w.s_NameJ)")
         
         }
         }catch{
         print("decode error")
         }
         
         //デコードKenshinData3
         let decoder4: JSONDecoder = JSONDecoder()
         do {
         kenshinInput3 = try decoder4.decode([KenshinInput].self, from: lecturerData4)
         for w in kenshinInput3 {
         print("お客さま名は" + "\(w.s_NameJ)")
         
         }
         }catch{
         print("decode error")
         }
         */
        //デコードKenshinData
        let decoder5: JSONDecoder = JSONDecoder()
        do {
            kenshinData = try decoder5.decode([KenshinInput].self, from: lecturerData5)
        }catch{
            print("decode error")
        }
        print("好きな配列の値が出せるか")
        print(self.kenshinData[1].s_NameJ)
        
        print("号情報")
        print(self.goh[0].s_MachiJ)
        
        /****************
         kenshinDataを号毎に分ける
         ****************/
        
        
        for w in kenshinData{
            kenshinGoh.append(w.s_GouBan)
        }
        print("kenshinDataの個数")
        print(kenshinGoh.count)
        
        //号の重複削除
        let orderedSet = (NSOrderedSet(array: kenshinGoh))
        kenshinGohD = orderedSet.array as![String]
        
        print("重複削除後の号の数")
        print(kenshinGohD.count)
        
        for j in kenshinData{
            if kenshinGohD[i] == j.s_GouBan{
                count = count + 1
            }else{
                devideArray.append(count)
                i = i+1
                count = count + 1
            }
        }
        for w in devideArray{
            print("devideArrayの値")
            print(w)
        }
        
        
        
        /***************
         検索バーの初期実行
         ***************/
        //デリゲート先を自分に設定する。
        customerSearchBar.delegate = self
        
        //何も入力されていなくてもReturnキーを押せるようにする。
        customerSearchBar.enablesReturnKeyAutomatically = false
        
        //検索結果配列にデータをコピーする。
        searchResult = self.kenshinData
        
        //キャンセルボタンの追加
        customerSearchBar.showsCancelButton = true
        
        print("searchResultの値は出せるか")
        print(searchResult[1].s_NameJ)
        
        
        
        
        /****************************
          ここから地図表示
        ****************************/
        
        // 座標算出用の住所を入力します
        //市町村名：s_MachiJ
        //丁目：s_Adrs1 番地：s_Adrs2 号：s_Adrs3
        
        
        
        let city1  = self.goh[0].s_MachiJ
        var tyome1 = self.kenshinData[0].s_Adrs1
        var banti1 = self.kenshinData[0].s_Adrs2
        var ggoh1  = self.kenshinData[0].s_Adrs3
        
        
        let city2  = self.goh[1].s_MachiJ
        var tyome2 = self.kenshinData[devideArray[0]].s_Adrs1
        var banti2 = self.kenshinData[devideArray[0]].s_Adrs2
        var ggoh2  = self.kenshinData[devideArray[0]].s_Adrs3
        
        
        let city3  = self.goh[2].s_MachiJ
        var tyome3 = self.kenshinData[devideArray[1]].s_Adrs1
        var banti3 = self.kenshinData[devideArray[1]].s_Adrs2
        var ggoh3  = self.kenshinData[devideArray[1]].s_Adrs3

        
        //Jsonファイルは先頭に0が含まれるので緯度、経度を求める前に事前削除しておく
        tyome1 = tyome1.replacingOccurrences(of:"0",with:"")
        banti1 = banti1.replacingOccurrences(of:"0",with:"")
        ggoh1  = ggoh1.replacingOccurrences(of:"0",with:"")
        
        tyome2 = tyome1.replacingOccurrences(of:"0",with:"")
        banti2 = banti1.replacingOccurrences(of:"0",with:"")
        ggoh2  = ggoh1.replacingOccurrences(of:"0",with:"")
        
        
        tyome3 = tyome1.replacingOccurrences(of:"0",with:"")
        banti3 = banti1.replacingOccurrences(of:"0",with:"")
        ggoh3  = ggoh1.replacingOccurrences(of:"0",with:"")
 
        
        
        let street1 = tyome1 + "-" + banti1 + "-" + ggoh1
        let street2 = tyome2 + "-" + banti2 + "-" + ggoh2
        let street3 = tyome3 + "-" + banti3 + "-" + ggoh3
        
        
        
        // 建物名が含まれると正しく座標が表示されないことがあるので注意が必要です
        let addressForLocation1 = city1 + street1
        let addressForLocation2 = city2 + street2
        let addressForLocation3 = city3 + street3
        
        
        
        
        // 入力された住所を元に取材地の座標を登録（１カ所目）
        let geocoder1 = CLGeocoder()
        geocoder1.geocodeAddressString(addressForLocation1, completionHandler: {(placemarks, error) in
            
            if(error == nil) {
                for placemark in placemarks! {
                    let location:CLLocation = placemark.location!
                    
                    let ano1 = GohObjectAnnotation(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), glyphText:"G1", glyphTintColor: .white, markerTintColor: .red,title: "1")
                    
                    self.annotation.append(ano1)
                    self.annotation2.append(ano1)
                    
                }
            }
        })
    
        
        
        
        
        // 入力された住所を元に取材地の座標を登録（２カ所目）
        let geocoder2 = CLGeocoder()
        geocoder2.geocodeAddressString(addressForLocation2, completionHandler: {(placemarks, error) in
            
            if(error == nil) {
                for placemark in placemarks! {
                    let location:CLLocation = placemark.location!
                    
                    let ano1 = GohObjectAnnotation(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), glyphText:"G2", glyphTintColor: .white, markerTintColor: .red,title: "2")
                    self.annotation.append(ano1)
                    self.annotation2.append(ano1)
                    
                }
            }
        })
        
        // 入力された住所を元に取材地の座標を登録（3カ所目）
        let geocoder3 = CLGeocoder()
        geocoder3.geocodeAddressString(addressForLocation3, completionHandler: {(placemarks, error) in
            
            if(error == nil) {
                for placemark in placemarks! {
                    let location:CLLocation = placemark.location!
                    
                    let ano1 = GohObjectAnnotation(CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude), glyphText:"G3", glyphTintColor: .white, markerTintColor: .red,title: "3")
                    
                    self.annotation.append(ano1)
                    self.annotation2.append(ano1)
                    self.AreaMapView.addAnnotations(self.annotation)
                    print("annotationの数")
                    print(self.annotation.count)
                    
                    //中心座標
                    print("地図の座標を確認")
                    let center = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
                    
                    //表示範囲
                    let span = MKCoordinateSpanMake(0.05, 0.05)
                    
                    //中心座標と表示範囲をマップに登録する。
                    let region = MKCoordinateRegionMake(center, span)
                    self.AreaMapView.setRegion(region, animated:true)
                }
            }
        })
        
        //画面に号の略称と和名を表示
        gohAbb.text = ""
        gohName.text = "本日対象"
        
    }
    
    func action(){
        var cr:MKCoordinateRegion = AreaMapView.region
        cr.span.latitudeDelta = 0.1
        cr.span.longitudeDelta = 0.1
        AreaMapView.setRegion(cr, animated: true)
    }
    
    
    
    /**************************
    テーブルビュー 処理
    ***************************/
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("セルの個数指定")
        return searchResult.count
    }

    //セルに値を設定するデータソースメソッド（必須）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
       // let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "KenshinDataCell", for: indexPath) //旧セル
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CustomerTableViewCell", for: indexPath) //新セル
        // セルに表示する値を設定する
        /*print("セルに値を格納する")
        cell.textLabel!.text = searchResult[indexPath.row].s_GasSecchi
        cell.detailTextLabel?.text = searchResult[indexPath.row].s_NameJ*/
        // cell.textLabel!.text = self.weather[indexPath].date
        
        if let cell = cell as? CustomerTableViewCell {
            cell.setupCell(model: searchResult[indexPath.row])
        }
        
        
        return cell
    }
    
    //検索ボタン押下時の呼び出しメソッド
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("検索ボタン押下時メソッドが実行されるか")
        customerSearchBar.endEditing(true)
        
        //検索結果配列を空にする。
        searchResult.removeAll()
        
        if(customerSearchBar.text == "") {
            //検索文字列が空の場合はすべてを表示する。
            searchResult = self.kenshinData
        } else {
            //検索文字列を含むデータを検索結果配列に追加する。
            for data in self.kenshinData {
                //配列（data)の中に検索入力内容を含むデータがあるか調べる
                if data.s_GasSecchi.contains(customerSearchBar.text!) {
                    searchResult.append(data)
                }
                
                if data.s_NameJ.contains(customerSearchBar.text!) {
                    searchResult.append(data)
                }
                
            }
            
            //画面に号の略称と和名を表示
            gohAbb.text = ""
            gohName.text = "検索結果"
        }
        //テーブルを再読み込みする
        customerTableView.reloadData()
        
        //キーボードを閉じる
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ピンが選択された際に入る
    func mapView(_ mapView : MKMapView,didSelect view : MKAnnotationView){
        print("ピンの選択")
        print(view.annotation!.title!!)
        print(kenshinData[0].s_GouBan)
        //検索結果配列を空にする。
        searchResult.removeAll()
        count2 = 0
        
        //選んだ号によって表示させるデータを絞る
        for data in self.kenshinData{
            if data.s_GouBan.contains(view.annotation!.title!!){
                searchResult.append(data)
            }
        }

        //テーブルを再読み込みする
        customerTableView.reloadData()
        
        //号の略称、和名を表示させる
        if (view.annotation!.title!! == "1"){
            gohAbb.text = "G1"
            gohName.text = goh[0].s_MachiJ
        }else if (view.annotation!.title!! == "2"){
            gohAbb.text = "G2"
            gohName.text = goh[1].s_MachiJ
        }else{
            gohAbb.text = "G3"
            gohName.text = goh[2].s_MachiJ
        }
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView,didSelectRowAt indexPath: IndexPath) {
        print("Cell選択処理実行")
        // 選択した列を変数に格納。格納する際にInt型をString型に型変換
        selectedNumber = indexPath.row
    }
    
    //テーブルビュー スクロール
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        return
    }
    
    //Mapクラスタリンク用に作成
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier, for: annotation)
        
        guard let markerAnnotationView = annotationView as? MKMarkerAnnotationView,
            let gohObjectAnnotation = annotation as? GohObjectAnnotation else { return annotationView }
        
        markerAnnotationView.clusteringIdentifier = GohObjectAnnotation.clusteringIdentifier
        markerAnnotationView.glyphText = gohObjectAnnotation.glyphText
        markerAnnotationView.glyphTintColor = gohObjectAnnotation.glyphTintColor
        markerAnnotationView.markerTintColor = gohObjectAnnotation.markerTintColor
        
        return markerAnnotationView
    }
    
    
    //遷移先の画面を取り出す
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        print("次画面呼び出し実行")
        //次の画面を取り出す
        let viewController = segue.destination as! ViewController_CustomInfo
        viewController.selectedKenshinInput = self.kenshinData
        viewController.selectedNumber = self.selectedNumber
        
    }
    
}
