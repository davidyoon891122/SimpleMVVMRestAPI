//
//  UserModel.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/03.
//

import Foundation


struct  User: Identifiable, Decodable {
    let id = UUID()
    let userID: Int
    let userEmail: String
    let userName: String
    let userPassword: String
    let userProFile: String
}
