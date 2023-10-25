import UIKit

/*
 1. Struct is Value & Class is Reference Type
 - A struct is a value type and will create a unique copy for each new reference.
 - References to a class instance share single data which means that any changes in that class will be available to each reference
 */
print("\n \n")
print("1. Struct is Value & Class is Reference Type ->")

class ArticleClass {
    let title: String
    let url: URL?
    var readCount: Int = 0
    
    init(title: String, url: URL?) {
        self.title = title
        self.url = url
    }
}

let articleClass = ArticleClass(title: "Struct vs Class", url: nil)
let articleClassCopy = articleClass

articleClass.readCount = 10
print(articleClassCopy.readCount) // Prints: 10


struct ArticleStruct {
    let title: String
    let url: URL?
    var readCount: Int = 0
}

var articleStruct = ArticleStruct(title: "Struct vs Class", url: nil, readCount: 0)
var articleStructCopy = articleStruct

articleStruct.readCount = 10
print(articleStructCopy.readCount) // Prints: 0


/*
 2. Class can inherit, Struct can't
 */
print("\n \n")
print("2. Class can inherit, Struct can't ->")

class AnimalClass {
    func eat() {
        print("I can eat")
    }
}

class DogClass: AnimalClass {
    
}
var dog = DogClass()
dog.eat()

struct AnimalStruct {
    func eat() {
        print("I can eat")
    }
}

// struct DogStruct: AnimalStruct {} // Error: Inheritance from non-protocol type 'AnimalStruct'

/*
 3. Class can deinit, Struct can't
 Deinitialization is a process to deallocate class instances when they're no longer needed.
 This frees up the memory space occupied by the system.
 */
print("\n \n")
print("3. Class can deinit, Struct can't ->")

class  Race {
    var laps: Int
    
    // define initializer
    init() {
        laps = 5
        print("Race Completed")
        print("Total laps:", laps)
    }
    
    // define deinitializer
    deinit {
        print("Memory Deallocated")
    }
}

// create an instance
var result: Race? = Race()

// deallocate object
result = nil
