//
//  UserService.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import Foundation

struct Credentials {
    static let password = "possom"
}

enum LoginResult {
    case success
    case failure(Error)
}

protocol UserServicing {
    var userName: String? { get set }
    var isLoggedIn: Bool { get }
    func login(userName: String, password: String) -> LoginResult
    func logout(completion: @escaping () -> Void)
}

class UserService: UserServicing {
    var userName: String? {
        get { UserDefaults.standard.string(forKey: "UserName") }
        set { UserDefaults.standard.set(newValue, forKey: "UserName") }
    }
    
    var isLoggedIn: Bool {
        guard let userName = userName, !userName.isEmpty else { return false }
        return true
    }
    
    func login(userName: String, password: String) -> LoginResult {
        guard password.lowercased() == Credentials.password.lowercased() else {
            return LoginResult.failure(UserService.Error.general)
        }
        
        self.userName = userName
        return LoginResult.success
    }
    
    func logout(completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.userName = nil
            completion()
        }
    }
    
    enum Error: LocalizedError {
        case general
        
        var errorDescription: String? {
            switch self {
            case .general:
                return "incorrect user name or password"
            }
        }
    }
}
