//
//  EditView.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import SwiftUI

struct EditView: View {
    @Binding var item: String
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
                }.onDisappear{
                    item=displayItem
                }
            }
        }
    }
}

