//
//  ContentView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct ContentView: View {
 
    
    @Binding var model:DataModel
    
    var body: some View {
        NavigationView{
            VStack{
                EditView(item: $model.title, model: $model)
                List{
                    ForEach($model.friends,id: \.self){
                        $data in
                        NavigationLink(destination:DetailView(person: $data,model: $model)){
                            Text(data.desc)
                        }
                    }.onDelete{
                        idx in model.friends.remove(atOffsets: idx)
                        model.save()
                    }.onMove{
                        idx,i in model.friends.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                }
            }.navigationTitle(model.title)
                .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                    model.friends.append(Person(firstName: "New", lastName: "Friend"))
                    model.save()
                })
        }
    }
}
 
 
