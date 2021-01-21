//
//  PublishedDemoApp.swift
//  PublishedDemo
//
//  Created by David M Reed on 1/20/21.
//

import SwiftUI

@main
struct PublishedDemoApp: App {
    var person = Person()
    var body: some Scene {
        WindowGroup {
            ContentView(person: person)
        }
    }
}
