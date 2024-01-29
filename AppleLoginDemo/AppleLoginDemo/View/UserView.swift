//
//  UserView.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import SwiftUI

struct UserView: View {
    var user: User

    var body: some View {
        VStack {
            Text("Welcome, \(user.name ?? "User")")
            Text("Email: \(user.email ?? "Not available")")
            Text("authorizationCode: \(user.authorizationCode ?? "ㅇㅇ")")
            Text("identityToken: \(user.identityToken ?? "ㅇ")")
            // 다른 사용자 정보 표시
        }
    }
}

