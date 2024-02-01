//
//  FirestoreService.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/30.
//

import Foundation
import FirebaseStorage
import Firebase

class FirestoreService {
    static let shared = FirestoreService()

    private init() {}

    func saveUserToFirestore(user: UserModel) {
        let db = Firestore.firestore()

        let userData = [
            "id": user.id ?? "",
            "loginId": user.loginId ?? "",
            "nickname": user.nickname ?? "",
            "joinDate": Date(),
            "fcmToken": user.fcmToken ?? ""
        ] as [String : Any]

        db.collection("UserModel").document(user.id ?? "").setData(userData) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("저장 성공")
            }
        }
    }
}
