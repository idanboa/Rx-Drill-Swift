//
//  MainViewModel.swift
//  RxDrill
//
//  Created by Idan Boadana on 01/02/2022.
//

import Foundation

class MainViewModel {
    // Rx inputs:
    
    // Rx outputs:
    var userName: String? {
        userService.userName
    }
    
    private let userService: UserServicing!
    private let searchService: SearchServicing!
    
    init(userService: UserServicing, searchService: SearchServicing) {
        self.userService = userService
        self.searchService = searchService
    }
    
    func search(query: String?) -> [String] {
        searchService.search(query: query)
    }
    
    func logout(completion: @escaping () -> Void) {
        userService.logout(completion: completion)
    }
}
