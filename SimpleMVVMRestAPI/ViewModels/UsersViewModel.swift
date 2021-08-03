//
//  UsersViewModel.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/03.
//

import Foundation


class UsersViewModel: ObservableObject {
    
    @Published var usersMessage = "Test User Info Rest API"
    
    @Published var users: [User] = [
        .init(id: 0, email: "test", name: "test", pw: "test", profile: "test"),
        .init(id: 0, email: "test", name: "test", pw: "test", profile: "test"),
    ]
    
    /*
     = [
         .init(name: "TEST_1"),
         .init(name: "TEST_2"),
         .init(name: "TEST_3")
     ]
    let USER_ID: Int
    let EMAIL: String
    let NAME: String
    let PW: String
    let PROFILE: String
    */
    
    func fetchUsers() {
        
        guard let url = URL(string: "https://enigmatic-falls-66086.herokuapp.com/users") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print(String(describing: error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("HTTPResonse problem")
                return
            }
            
            guard let data = data else {
                print("data problem")
                return
            }
            
            DispatchQueue.main.async {
                do {
                    self.users = try JSONDecoder().decode([User].self, from: data)
                } catch let error {
                    print(String(describing: error))
                }
            }
            
        }.resume()
    }
    
}
