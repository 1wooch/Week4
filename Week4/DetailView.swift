//
//  DetailView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct DetailView: View {
    @Binding var person: Person
    @Binding var model:DataModel
    @State var fname: String=""
    @State var lname: String=""
    @State var age: String=""
    //age is int but for the text field we use string
    var body: some View {
        VStack{
            Text("First Name: \(fname)")
            EditView(item: $fname, model: $model)
            
            Text("Last Name: \(lname)")
            EditView(item: $lname, model: $model)
            
            Text("Age: \(age)")
            EditView(item: $age, model: $model)
            
            Spacer()
            
        }.navigationTitle("Edit Friend Info").navigationBarItems( trailing: EditButton()).onAppear{
            fname=person.firstName
            lname=person.lastName
            age=person.strAge
            model.save()
            
        }.onDisappear{
            person.firstName=fname
            person.lastName=lname
            person.strAge=age
            model.save()
        }.padding()
    }
}

