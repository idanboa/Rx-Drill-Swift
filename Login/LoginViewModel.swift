//
//  MainViewModel.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import Foundation

class LoginViewModel {
    // RX inputs:
    
    // RX outputs:
    
    var isLoggedIn: Bool {
        userService.isLoggedIn
    }
    
    private let userService: UserServicing!
    
    init(userService: UserServicing) {
        self.userService = userService
    }
    
    func login(userName: String, password: String) -> LoginResult {
        userService.login(userName: userName, password: password)
    }
}
