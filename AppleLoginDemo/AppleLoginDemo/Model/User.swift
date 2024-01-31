//
//  User.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import Foundation

struct User: Identifiable {
    var id: String?                    //고유 아이디 CI 값
    var loginId: String?                //로그인 아이디
    var passsword: String?                //비밀번호
    var nickname: String?                //닉네임
    var phoneNumber: String?            //보류
    var profileURL: String?                //프사
    var location: [[Double?]]?            //내 동네
    var distance: Int?                    //내 위치에서의 거리(원)
    var joinDate: Date?                  //가입일 (파베는 number
    var fcmToken: String?                //fcm 토큰
}

//struct User {
//    var uid: String
//    var name: String?
//    var email: String?
//    var identityToken: String?
//    var authorizationCode: String?
//}
