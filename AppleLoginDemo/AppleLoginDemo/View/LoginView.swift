//
//  LoginView.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import SwiftUI
import AuthenticationServices

struct LoginView: View {
    @StateObject var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            if authViewModel.isSignedIn, let user = authViewModel.currentUser {
                UserView(user: user)
            } else {
                
                Button(action: startAppleSignIn) {
                    ZStack {
                        Image("AppleLogo")
                            .resizable()
                            .frame(width: 39, height: 39)
                            .clipShape(Circle())
                    }
                }
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 50)
                .cornerRadius(5)
            }
        }
        .frame(height:UIScreen.main.bounds.height)
        .background(Color.white)

    }
    
    private func startAppleSignIn() {
        let request = ASAuthorizationAppleIDProvider().createRequest()
        request.requestedScopes = [.fullName, .email]

        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = authViewModel
        controller.performRequests()
    }
}

#Preview {
    LoginView()
}
