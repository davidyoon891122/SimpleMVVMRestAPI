//
//  ContentView.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/02.
//

import SwiftUI

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
    }
}





struct ContentView: View {
    
    @ObservedObject var coursesVM = CoursesViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(coursesVM.messages)
                
                ForEach(coursesVM.courses) { course in
                    Text(course.name)
                }
                
                
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                print("Fetching json data")
                
                self.coursesVM.changeMesssage()
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
