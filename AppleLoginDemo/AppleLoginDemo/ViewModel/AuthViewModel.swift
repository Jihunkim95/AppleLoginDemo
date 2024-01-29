//
//  AuthViewModel.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import Foundation
import AuthenticationServices

class AuthViewModel: NSObject, ObservableObject, ASAuthorizationControllerDelegate {
    @Published var isSignedIn = false
    @Published var currentUser: User?
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
            let email = appleIDCredential.email
            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
            let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)

            DispatchQueue.main.async {
                self.currentUser = User(
                    userIdentifier: userIdentifier,
                    name: name,
                    email: email,
                    identityToken: identityToken,
                    authorizationCode: authorizationCode
                )
                self.isSignedIn = true
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Login Failed: \(error.localizedDescription)")
    }
    
}
