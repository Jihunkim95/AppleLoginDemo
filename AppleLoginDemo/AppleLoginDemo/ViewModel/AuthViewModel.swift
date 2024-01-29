//
//  AuthViewModel.swift
//  AppleLoginDemo
//
//  Created by 김지훈 on 2024/01/29.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var currentUser: User?
}
