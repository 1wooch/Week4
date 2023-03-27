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
    @State var myGuests=[
    Guest(name: "Tom"),Guest(name: "Jerry")
    ]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(myGuests,id: \.self) {
                    guest in
                    /*@START_MENU_TOKEN@*/Text(guest.name)/*@END_MENU_TOKEN@*/
                }.onDelete{
                    indecs in myGuests.remove(atOffsets: indecs)
                    //indecs??
                    
                    
                }
            }.navigationBarItems(leading: EditButton(), trailing:Button("+"){
                //enter what + button will do if it clicked
                let newGuest = Guest(name: "New Guest \(myGuests.count)")
                myGuests.append(newGuest)
            }).navigationTitle("My Guests")
            
        }}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
