//
//  AuthViewModel.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import Foundation
import AuthenticationServices
import FirebaseFirestore
import FirebaseCore

class AppleAuthManager: NSObject, ASAuthorizationControllerDelegate {
    var isSignedIn = false
    var currentUser: User?

    // 상태 변경을 알리기 위한 클로저
    var didChangeSignInStatus: ((Bool, User?) -> Void)?

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let name = (fullName?.familyName ?? "") + (fullName?.givenName ?? "")
            let email = appleIDCredential.email
            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)


            DispatchQueue.main.async {
                let user = User(
                    id: userIdentifier,
                    loginId: email,
                    nickname: name,
                    fcmToken: identityToken
//
//                    identityToken: identityToken,
//                    authorizationCode: authorizationCode
                )
                self.currentUser = user
                self.isSignedIn = true
                self.didChangeSignInStatus?(true, user)
                FirestoreService.shared.saveUserToFirestore(user: user)
            }
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple Login Failed: \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.didChangeSignInStatus?(false, nil)
        }
    }
}
