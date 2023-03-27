//
//  DataModel.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import Foundation

struct Person:Hashable
{
    var firstName:String
    var lastName:String
    var age: Int? //what is question mark for? -> could be exist or not
}

struct DataModel{
    var friends:[Person]
    
}

var testFriends = [
    Person(firstName: "Tom", lastName: "Cat", age: 3),
    Person(firstName: "Jerry", lastName: "Mouse")
    
]

extension Person{
    var fullName:String{
        return "\(firstName) \(lastName)"
    }
    var desc:String{
        if let age=age{
            return "\(fullName) (\(age))"
        }
        return fullName
    }
}
