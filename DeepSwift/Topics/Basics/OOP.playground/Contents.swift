import UIKit

/*
 1. Object
 */
print("\n \n")
print("1. Object ->")

// Abstraction part
protocol AnimalAction{
    func play() -> String
}

class Animal: AnimalAction{
    let name: String
    let age: Int
    
    // Encapsulation part
    private var isFed: Bool = false
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func makeSomeNoise() -> String {
        return "Meowwww~"
    }
    
    // Encapsulation part
    func feedFood() {
        isFed = true
    }
    
    // Encapsulation part
    func isHungry() -> String {
        let hungry = isFed ? "not hungry" : "hungry"
        return "\(name) is \(hungry)"
    }
    
    // Abstraction part
    func play() -> String {
        return "I don't want to play"
    }
}
// create object from Animal class
let animalObject = Animal(name: "HushHush", age: 3)

/*
 2. Inheritance
 - Inheritance allow derived classes to share interfaces and codes of their base classes.
 */
print("\n \n")
print("2. Inheritance ->")

// Dog inherit from Animal
class Dog: Animal{
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
}

// Cat inherit from Animal
class Cat: Animal{
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
}

// create object
let popo = Dog(name: "Popo", age: 1)
let lolo = Dog(name: "Lolo", age: 3)

let dodo = Cat(name: "Dodo", age: 2)
let momo = Cat(name: "Momo", age: 4)

/*
 3. Polymorphism
 - Polymorphism is the concept where objects of different types can be accessed through the same interface.
 */
print("\n \n")
print("3. Polymorphism ->")

class Bird: Animal {
    override init(name: String, age: Int) {
        super.init(name: name, age: age)
    }
    
    override func makeSomeNoise() -> String {
        return "Chirrpp~"
    }
}

let birdy = Bird(name: "Birdy", age: 7)
let twitie = Bird(name: "Twitie", age: 4)

dodo.makeSomeNoise()
momo.makeSomeNoise()

birdy.makeSomeNoise()
twitie.makeSomeNoise()

/*
 4. Encapsulation
 - Encapsulation is the ability of an object to hide part of its state and behaviour from other objects, exposing only a limited interface for the rest of the program.
 */
print("\n \n")
print("4. Encapsulation ->")

// SEE Encapsulation part @ (1. Object)

momo.feedFood()
momo.isHungry()

dodo.isHungry()

/*
 5. Abstraction
 */
print("\n \n")
print("5. Abstraction ->")

// SEE Abstraction part @ (1. Object)

class Fish: Animal {
    override func play() -> String {
        return "Jump of the water"
    }
}

let bibi = Fish(name: "Bibi", age: 4)

popo.play()

momo.play()

twitie.play()

bibi.play()
