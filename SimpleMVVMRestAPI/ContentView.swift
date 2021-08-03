//
//  ContentView.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/02.
//

import SwiftUI
// Model
struct Course:Identifiable, Decodable {
    let id = UUID()
    let name: String
    
}


class CoursesViewModel: ObservableObject {
    @Published var messages = "Message inside observable object"
    
    @Published var courses: [Course] = [
        .init(name: "TEST_1"),
        .init(name: "TEST_2"),
        .init(name: "TEST_3")
    ]
    
    
    func changeMesssage() {
        self.messages = "BLAH BLAH BLAH"
    }
    
    
    func fetchCourses() {
        // fetch json and decode and update some array property
        
        guard let url = URL(string: "URL") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                print(String(describing: error!))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return
            }
            
            guard let data = data else {
                print("data Error ")
                return
            }
            do {
                self.courses = try JSONDecoder().decode([Course].self, from: data)
            } catch let error {
                print(String(describing: error))
            }
            
        }.resume()
    }
}





struct ContentView: View {
    
    @ObservedObject var coursesVM = CoursesViewModel()
    @ObservedObject var usersVM = UsersViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(usersVM.usersMessage)
                
                ForEach(usersVM.users) { user in
                    Text(user.EMAIL)
                    Text(user.NAME)
                    Text(user.PW)
                    Text(user.PROFILE)
                    
                }
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                print("Fetching json data")
                //self.coursesVM.fetchCourses()
                self.usersVM.fetchUsers()
                
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
