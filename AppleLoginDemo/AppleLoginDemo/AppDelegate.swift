//
//  AppDelegate.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/30.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      //FireStore배포환경시에는 로컬 주석처리
//      Auth.auth().useEmulator(withHost: "localhost", port: 9099)

    return true
  }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        return GIDSignIn.sharedInstance.handle(url)
//    }
}

