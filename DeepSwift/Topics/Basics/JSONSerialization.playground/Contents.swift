import UIKit
import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct Toy: Codable {
    var name: String
    var color: String? // can be nil value
    var friends: [Toy]? // array value, the value can be any type
}

struct Employee: Codable {
    var name: String
    var gift: Toy
}

struct Kid: Codable {
    var name: String
    var toy: Toy
    
    enum CodingKeys: String, CodingKey {
        case name, toy = "favoriteToy" // parsing different key from json
    }
}

var toyData: Data?
do {
    guard let fileUrl = Bundle.main.url(forResource: "toy", withExtension: "json") else { fatalError() }
    toyData = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).data(using: .utf8)!
} catch {
    print(error)
}

var kidData: Data?
do {
    guard let fileUrl = Bundle.main.url(forResource: "kid", withExtension: "json") else { fatalError() }
    kidData = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).data(using: .utf8)!
} catch {
    print(error)
}

var employeeData: Data?
do {
    guard let fileUrl = Bundle.main.url(forResource: "employee", withExtension: "json") else { fatalError() }
    employeeData = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8).data(using: .utf8)!
} catch {
    print(error)
}

// Decode Toy data
let woodyToy = try decoder.decode(Toy.self, from: toyData!)
print(woodyToy)
if let woodyFriends = woodyToy.friends {
    print(woodyFriends[0])
}


// Decode Employee data
let johnEmployee = try decoder.decode(Employee.self, from: employeeData!)
print(johnEmployee)


// Decode Kid data
let mauiKid = try decoder.decode(Kid.self, from: kidData!)
print(mauiKid)
