import UIKit


// 1. Variable vs Constant Stored Properties
print("\n=========================================================================================================")
print("1. VARIABLE VS CONSTANT PROPERTIES")

var greetingPlayground = "Hello, playground"
let greetingSwift = "Hello, swift"

greetingPlayground = "Hello, updating playground"
//greetingSwift = "Hello, updating swift" //*ERROR because of greetingSwift is constant property (let)



/*
=========================================================================================================
2. Stored properties
*/
print("\n=========================================================================================================")
print("2. STORED PROPERTIES")

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
//rangeOfThreeItems.length = 5 //*ERROR because length is constant property

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6 //*ERROR because rangeOfFourItems is constant

class NewsItem {
    var title: String?
    let author: String?
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

var abcAuthor = NewsItem(title: "Learn Swift", author: "Bimo")
abcAuthor.title = "Learn Playground"
//abcAuthor.author = "Sekti"

/*
=========================================================================================================
3. Lazy properties
tag: lazy
*/
print("\n=========================================================================================================")
print("3. LAZY PROPERTIES")

struct Person {
    let name: String
    let age: Int
}

struct People {
    var people: [Person]
    lazy var oldest: Person? = {
        return people.max(by: {$0.age < $1.age})
    }()
    
    init(people: [Person]) {
        self.people = people
    }
}

var peopleModel = People(people: [
    Person(name: "Alex", age: 25),
    Person(name: "Borne", age: 26),
    Person(name: "Musi", age: 27),
    Person(name: "Noni", age: 28),
    Person(name: "Yoan", age: 29),
    Person(name: "Mike", age: 30),
])

print(peopleModel.oldest) // oldest initialized
peopleModel.people.append(Person(name: "Jan", age: 69))
print(peopleModel.oldest) // oldest person is still Mike because oldest is already initialized


/*
=========================================================================================================
4. Computed Properties
*/
print("\n=========================================================================================================")
print("4. COMPUTED PROPERTIES")

struct Identity {
    var firstName: String
    var lastName: String
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
    }
    var birthYear: Int?
    var age: Int {
        get {return 2023 - (birthYear ?? 0)}
        set {
            self.introduction = "Hello my name is \(firstName), I am \(newValue) years old"
        }
    }
    var introduction: String?
}
var student1 = Identity(firstName: "Boxi", lastName: "Maxim", birthYear: 1999)
print(student1.fullName)
student1.age = 40
print(student1.introduction!)


/*
=========================================================================================================
5. Property Observers
tag: wiilSet, didSet
*/
print("\n=========================================================================================================")
print("5. PROPERTY OBSERVERS")

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

var stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 300
