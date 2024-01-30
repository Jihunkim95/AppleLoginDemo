//
//  AppleLoginDemoApp.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct AppleLoginDemoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
