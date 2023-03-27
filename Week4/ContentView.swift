//
//  ContentView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct Guest:Hashable{
    var name:String="<unknown>"
}

struct ContentView: View {
    //@State var clickTimes = 0
    //@State var myGuests=[
    //Guest(name: "Tom"),Guest(name: "Jerry")
    //]
    
    @Binding var model:DataModel
    @State var myTitle = "Friend List"
    var body: some View {
        NavigationView{
            VStack{
                EditView(item: $myTitle)
                List{
                    ForEach(model.friends,id: \.self){
                        data in Text(data.desc)
                    }.onDelete{
                        idx in model.friends.remove(atOffsets: idx)
                        model.save()
                    }.onMove{
                        idx,i in model.friends.move(fromOffsets: idx, toOffset: i)
                        model.save()
                    }
                }
            }.navigationTitle(myTitle)
                .navigationBarItems(leading: EditButton(), trailing: Button("+"){
                    model.friends.append(Person(firstName: "New", lastName: "Friend"))
                    model.save()
                })
        }
    }
}
 
 
