//
//  UserModel.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/03.
//

import Foundation


struct User: Codable, Identifiable {
    let id = UUID()
    let USER_ID: Int
    let EMAIL: String
    let NAME: String
    let PW: String
    let PROFILE: String
    
    
    init(id: Int, email: String, name: String, pw: String, profile: String) {
        USER_ID = id
        EMAIL = email
        NAME = name
        PW = pw
        PROFILE = profile
    }
    
}



