//
//  ContentView.swift
//  SimpleMVVMRestAPI
//
//  Created by David Yoon on 2021/08/02.
//

import SwiftUI

class CoursesViewModel: ObservableObject {
    @Published var messages = "Message inside observable object"
}


struct ContentView: View {
    
    @ObservedObject var coursesVM = CoursesViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(coursesVM.messages)
            }.navigationBarTitle("Courses")
            .navigationBarItems(trailing: Button(action: {
                print("Fetching json data")
                
                self.coursesVM.messages = "SOMETHING ELSE"
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
