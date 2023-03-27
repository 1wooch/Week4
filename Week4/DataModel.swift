//
//  DataModel.swift
//  Week4
//
//  Created by Wonwoo Choi on 27/3/2023.
//

import Foundation

struct Person:Hashable,Codable
{
    var firstName:String
    var lastName:String
    var age: Int? //what is question mark for? -> could be exist or not
}

func getFile()-> URL?{
    let filename="myfriends.json"
    let fm = FileManager.default
    guard let url = fm.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else{
        return nil
    } //guard let/????
    return url.appendingPathComponent(filename)
}


struct DataModel :Codable{
    var friends:[Person]
    init(){
        friends = []
        load() //initial start when program start to run
    }
    
    mutating func load(){
        guard let url = getFile(),
              let data = try? Data(contentsOf: url),
              let datamodel = try? JSONDecoder().decode(DataModel.self, from: data)else{
            self.friends=testFriends
            return
        }
        self.friends=datamodel.friends
            
    }
    func save(){
        guard let url = getFile(),
        let data = try? JSONEncoder().encode(self)
        else{
            return
        }
        try? data.write(to: url)
    }
    
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
    var strAge:String{
        get {
            if let a = age
            {
                return "\(a)"
            }
            return "<unknown>"
            
        }
        set{
            guard let a = Int(newValue) else{
                return
            }
            self.age=a
        }
    }
}
