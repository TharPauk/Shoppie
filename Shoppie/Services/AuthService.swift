//
//  AuthService.swift
//  Shoppie
//
//  Created by Min Thet Maung on 14/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import Foundation

class AuthService {
    static let instance = AuthService()
    
    var defaults = UserDefaults.standard
    
    var isLoggedIn: Bool {
        get {
            defaults.bool(forKey: "isLoggedIn")
        }
        set {
            defaults.set(newValue, forKey: "isLoggedIn")
        }
    }
}
