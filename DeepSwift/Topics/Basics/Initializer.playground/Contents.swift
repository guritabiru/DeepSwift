import UIKit


/*
 1. Designated Initializers
 Designated Initializers are the primary initializers for a structure or class.
 A designated initializer fully initializes all uninitialized properties introduced by that
 */

print("1. Designated Initializers ->")

class House {
    var address: String
    var color: String
    
    init(address: String, color: String) {
        self.address = address
        self.color = color
    }
}

let house = House(address: "Indonesia", color: "White")



/*
 2. Default Initializers
 
 Swift provides a default initializer for any class structure that provides default values for all of its properties and doesn't provide at least one initializer
 */

print("\n \n")
print("2. Default Initializers ->")

class ShoppingListItem {
    var name: String?
    var quantity: Int = 0
    var purchased = false
}

var item = ShoppingListItem()




/*
 3. Convenience Initializers
 
 Convenience initializer are secondary, supporting initializers for a class.
 A convenience initializer must call another initializer from the same class.
 A convinience initializer must ultimately call a designated initializer.
 */
print("\n \n")
print("3. Convenience Initializers ->")


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unknown food name")
    }
}

let food = Food()
print(food.name)


/*
 4. Failable Initializers
 A failable initializer creates an optional value of the type of initializes.
 You write return nil within a failable initializer to indicate a point at which initialization failure can be triggered
 */
print("\n \n")
print("4. Failable Initializers ->")

struct Temperature {
    var celsius: Double
    
    init?(celsius: Double){
        if celsius < -273.15 {
            return nil
        }
        self.celsius = celsius
    }
}

if let reallyReallyCold = Temperature(celsius: -280) {
    print("This should not be initialized")
}


/*
 5. Required Initializers
 */
print("\n \n")
print("5. Required Initializers ->")

class SomeClass {
    required init() {
        
    }
}

class SomeSubClass: SomeClass {
    let thisNeedsToInitialized: String
    required init() {
        self.thisNeedsToInitialized = "default value"
    }
}

/*
 6. Initializer Struct & Class
 */
print("\n \n")
print("6. Initializer Struct & Class ->")

// struct doesn't need init
struct Person {
    var name: String
    var age: Int
}

// class need init
class Car {
    var brand: String = "Toyota"
    var color: String
    
    init(color: String) {
        self.color = color
    }
}
