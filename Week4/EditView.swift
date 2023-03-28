//
//  EditView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var item: String
    @Binding var model:DataModel
    @State var displayItem:String=""
    @Environment(\.editMode) var editmode // make it into edit mode -> will explain more later
    var body: some View {
        VStack
        {
            if(editmode?.wrappedValue == .active){
                HStack{
                    
                    TextField("Input:",text:$displayItem)//Connect with displayItem
                    
                    Button("Cancel"){
                        displayItem=item
                    }
                }.onAppear{
                    displayItem = item
                    print("onappear")
                }.onDisappear{
                    item=displayItem
                    print("disappear")

                    model.save()
                }
            }
        }
    }
}

