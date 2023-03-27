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
    
    var body: some View {
        NavigationView{
            List{
                ForEach(model.friends,id: \.self){
                    data in Text(data.desc)
                    
                }
            }
        }
    }
}
 
 
