//
//  ContentView.swift
//  PublishedDemo
//
//  Created by David M Reed on 1/20/21.
//

import SwiftUI

class Person: ObservableObject {
    @Published var firstName: String
    @Published var lastName: String
    @Published var courses: [String] = []

    init(firstName: String = "", lastName: String = "") {
        self.firstName = firstName
        self.lastName = lastName
    }

    func addCourse(courseName: String) {
        courses.append(courseName)
    }
}

struct ContentView: View {
    // if the view "owns the data" use @StateObject for a class
    // or if the view is passed a class, use @ObservedObject
    @StateObject private var person = Person()
    @State private var courseName = ""
    var body: some View {
        VStack {
            TextField("first", text: $person.firstName)
            TextField("last", text: $person.lastName)
            TextField("course name", text: $courseName)
            Button("Add Course") {
                person.addCourse(courseName: courseName)
            }
            ForEach(person.courses.indices, id: \.self) { idx in
                HStack {
                    Text(person.courses[idx])
                    Spacer()
                }
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
