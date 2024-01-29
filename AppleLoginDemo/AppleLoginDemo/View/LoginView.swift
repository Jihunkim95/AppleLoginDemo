//
//  LoginView.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import SwiftUI

struct LoginView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            if authViewModel.isSignedIn, let user = authViewModel.currentUser {
                UserView(user: user)
            } else {
                AppleSigninButton(authViewModel: authViewModel)
            }
        }
        .frame(height:UIScreen.main.bounds.height)
        .background(Color.white)
    
    }
}

#Preview {
    LoginView()
}
