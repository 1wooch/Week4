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
        VStack{
            Text("First Name: \(fname)")
            EditView(item: $fname)
            
            Text("Last Name: \(lname)")
            EditView(item: $lname)
            
            Text("Age: \(age)")
            EditView(item: $age)
            
            Spacer()
            
        }.navigationTitle("Edit Friend Info").navigationBarItems( trailing: EditButton()).onAppear{
            fname=person.firstName
            lname=person.lastName
            age=person.strAge
            
        }.onDisappear{
            person.firstName=fname
            person.lastName=lname
            person.strAge=age
        }.padding()
    }
}

