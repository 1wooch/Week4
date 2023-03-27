//
//  Week4App.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

@main
struct Week4App: App {
    @State var model:DataModel = DataModel(friends: testFriends)
    var body: some Scene {
        WindowGroup {
            ContentView(model:$model)
        }
    }
}
