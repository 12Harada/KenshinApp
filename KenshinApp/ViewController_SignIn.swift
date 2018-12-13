//
//  ViewController_SignIn.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/01.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit
import LocalAuthentication

extension String {
  // 半角英数字を判定
  func isAlphanumeric() -> Bool {
    return NSPredicate(format: "SELF MATCHES %@", "[a-zA-Z0-9]+").evaluate(with: self)
  }
  // 半角数字を判定
  func isNumeric() -> Bool {
    return NSPredicate(format: "SELF MATCHES %@", "[0-9]+").evaluate(with: self)
  }
}

class ViewController_SignIn: UIViewController, UITextFieldDelegate {
  
  @IBOutlet weak var signText: UITextField!
  @IBOutlet weak var passText: UITextField!
  @IBOutlet weak var lblErrorMsg: UILabel!
  @IBOutlet weak var backImage: UIImageView!
  
  
  //原田追加
  var weather = [Weather]()
  var login: [Login] = []
  var loginUser = [Login]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("【ログイン画面】")

    let borderID = CALayer()
    let widthID = CGFloat(2.0)
    let borderPass = CALayer()
    let widthPass = CGFloat(2.0)
    
    signText.delegate = self
    passText.delegate = self
    //ID入力テキストの設定
    borderID.borderColor = UIColor.blue.cgColor
    borderID.frame = CGRect(x:0, y: signText.frame.size.height - widthID, width: signText.frame.size.width, height: 2)
    borderID.borderWidth = widthID
    
    //ID入力テキストの初期表示をDukeIDとする
    signText.placeholder = "Duke ID"
    signText.layer.addSublayer(borderID)
    //テキストボックスフォーカス時に数字のみのキーボード表示
    signText.keyboardType = UIKeyboardType.numberPad
    
    //パスワード入力テキストの設定
    borderPass.borderColor = UIColor.blue.cgColor
    borderPass.frame = CGRect(x:0, y: passText.frame.size.height - widthPass, width: passText.frame.size.width, height: 2)
    borderPass.borderWidth = widthPass
    
    //パスワード入力テキストの初期表示をPasswordとする
    passText.placeholder = "Password"
    passText.layer.addSublayer(borderPass)
    //テキストボックスフォーカス時に英字のみのキーボード表示
    passText.keyboardType = UIKeyboardType.numbersAndPunctuation
    

    //11/14 jsonファイル取り込み方法変更による追加
    guard let data = try? getJSONData() else { return }
    login = try! JSONDecoder().decode([Login].self, from: data!)
    print(login[0].person)
  
    
    
    // Do any additional setup after loading the view.
    /**************************************************
     天気情報取得がAPI連携によりデータ取得に時間がかかるためここでデータ取得
     **************************************************/
    let areaCode = "130010" // 東京エリア
    let urlWeather = "http://weather.livedoor.com/forecast/webservice/json/v1?city=" + areaCode
    
    if let url = URL(string: urlWeather) {
      let req = NSMutableURLRequest(url: url)
      req.httpMethod = "GET"
      
      let task = URLSession.shared.dataTask(with: req as URLRequest, completionHandler: {(data, resp, err) in
        //print(resp!.url!)
        //print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as Any)
        
        // 受け取ったdataをJSONパース、エラーならcatchへジャンプ
        
        do {
          // dataをJSONパースし、変数"getJson"に格納
          let getJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
          
          //print(getJson)
          ///*
          let forcasts = (getJson["forecasts"] as? NSArray)!
          for dailyForcast in forcasts {
            let forcast = dailyForcast as! NSDictionary
            let dateLabel = (forcast["dateLabel"] as? String)!
            let telop = (forcast["telop"] as? String)!
            let date = (forcast["date"] as? String)!
            
            let temperature = (forcast["temperature"] as? NSDictionary)!
            let minTemperature = (temperature["min"] as? NSDictionary)
            var minTemperatureCcelsius: String
            if minTemperature == nil {
              minTemperatureCcelsius = "-"
            }else{
              minTemperatureCcelsius = (minTemperature?["celsius"] as? String)!
            }
            
            let maxTemperature = (temperature["max"] as? NSDictionary)
            var maxTemperatureCcelsius: String
            if maxTemperature == nil {
              maxTemperatureCcelsius = "-"
            }else{
              maxTemperatureCcelsius = (maxTemperature?["celsius"] as? String)!
            }
            
            let image = (forcast["image"] as? NSDictionary)!
            let url = (image["url"] as? String)!
            let title = (image["title"] as? String)!
            let width = (image["width"] as? Int)!
            let height = (image["height"] as? Int)!
            
            self.weather.append(Weather(dateLabel: dateLabel, telop: telop, date: date, minTemperatureCcelsius: minTemperatureCcelsius, maxTemperatureCcelsius: maxTemperatureCcelsius, url: url, title: title, width: width, height: height))
          }
          print("■天気情報の取得（東京地区限定）")
          for w in self.weather {
            print("\(w.date)")
            print(self.weather[1].telop)
          }
          //*/
        } catch {
          print ("json error")
          return
        }
      })
      task.resume()
    }
  }
  
  //テキストからフォーカスが外れるとキーボードをしまう
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func buttonSignin(_ sender: UIButton) {
    print("ここにきていない？")
    //        //DukeIDチェック
    //        if signText.text!.isNumeric(){
    //            //ID、パスワードを次画面遷移用変数に格納
    //            login.person = signText.text!
    //        }
    //        else{
    //            lblErrorMsg.textColor = UIColor.red
    //            lblErrorMsg.text = "IDかパスワードが正しくありません！"
    //        }
    //        //パスワードチェック
    //        if passText.text!.isAlphanumeric(){
    //            //ID、パスワードを次画面遷移用変数に格納
    //            login.password = signText.text!
    //        }
    //        else{
    //            lblErrorMsg.textColor = UIColor.red
    //            lblErrorMsg.text = "IDかパスワードが正しくありません！"
    //        }
    
    //ファイルの内容読み込み(ユーザー情報)


    
    var str = ""
    let importURL:URL = URL(fileURLWithPath: "/LoginList.json")
    do {
      str = try String( contentsOf: importURL, encoding: String.Encoding.utf8 )
    } catch {
      print(error)
    }
    let lecturerData: Data = str.data(using: .utf8)!
    
    //デコード２
    let decoder: JSONDecoder = JSONDecoder()
    do {
      let newJson: [Login] = try decoder.decode([Login].self, from: lecturerData)
      
      for w in newJson {
        print("IDは" + "\(w.person)")
        print("パスワードは" + "\(w.password)")
      }
      
      
    } catch {
      print("json convert failed in JSONDecoder", error.localizedDescription)
    }
    
  }
  
    @IBAction func faceButton(_ sender: Any) {
        print("faceID認証の実行")
        var str:String = ""
        let ctx = LAContext()
        let localizedReasonString = "ロックを解除"
        var error: NSError?
        if ctx.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            ctx.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                               localizedReason: localizedReasonString) { (success, evaluateError) in
                                if success {
                                    let ac = UIAlertController(title: "認証成功",
                                                               message: "",
                                                               preferredStyle: .alert)
                                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                                    self.present(ac, animated: true)
                                   // self.performSegue(withIdentifier: "loginSegue", sender: nil)
                                    print("str:",str)
                                    str = "OK"
                                    print("str:",str)
                                } else {
                                    let ac = UIAlertController(title: "認証失敗",
                                                               message: evaluateError?.localizedDescription,
                                                               preferredStyle: .alert)
                                    ac.addAction(UIAlertAction(title: "OK", style: .default))
                                    self.present(ac, animated: true)
                                    str = "NG"
                                }
            }
        } else {
            print("Face IDが利用できない")
            let ac = UIAlertController(title: "Error",
                                       message: error?.localizedDescription,
                                       preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(5)) {
        print("str:",str)
        if(str == "OK"){
        self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    
  //11/14 json取り込み方法変更に伴う新規追加
  // GohInfo.json変換用
  func getJSONData() throws -> Data? {
    guard let path = Bundle.main.path(forResource: "LoginList", ofType: "json") else { return nil }
    let url = URL(fileURLWithPath: path)
    
    return try Data(contentsOf: url)
  }
    
    //遷移先の画面を取り出す
   override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        
        //次の画面を取り出す
      /*  let viewController = segue.destination as! ViewController_Hello
        viewController.loginUser = login
        viewController.weather = weather*/
    
    let barViewControllers = segue.destination as! UITabBarController
    let nav = barViewControllers.viewControllers![0] as! UINavigationController
    //let destinationViewController = nav.topviewcontroller as ViewController_Hello
    let destinationViewController = nav.viewControllers[0] as! ViewController_Hello
    destinationViewController.loginUser = login
    destinationViewController.weather = weather
        
    }
  
}



