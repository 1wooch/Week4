//
//  DetailView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var person: Person
    @State var fname: String=""
    @State var lname: String=""
    @State var age: String=""
    //age is int but for the text field we use string
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

