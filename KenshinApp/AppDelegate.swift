//
//  AppDelegate.swift
//  KenshinApp
//
//  Created by TomonariNonaka on 2018/09/01.
//  Copyright © 2018年 TomonariNonaka. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // 通知許可の取得
        UNUserNotificationCenter.current().requestAuthorization(
        options: [.alert, .sound, .badge]){
            (granted, _) in
            if granted{
                UNUserNotificationCenter.current().delegate = self
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
      //　通知設定に必要なクラスをインスタンス化
      let trigger: UNNotificationTrigger
      let content = UNMutableNotificationContent()
      //var notificationTime = DateComponents()
      
      // トリガー設定
      //notificationTime.hour = 17
      //notificationTime.minute = 0
      //trigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
      trigger = UNTimeIntervalNotificationTrigger(timeInterval: 20, repeats: false)
      
      
      // 通知内容の設定
      content.title = ""
      content.body = "システムメンテナンスのため本日14:30より通信機能を停止します"
      content.sound = UNNotificationSound.default()
      
      // 通知スタイルを指定
      let request = UNNotificationRequest(identifier: "uuid", content: content, trigger: trigger)
      // 通知をセット
      UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
  }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // アプリ起動中でもアラート&音で通知
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        completionHandler()
    }
}
