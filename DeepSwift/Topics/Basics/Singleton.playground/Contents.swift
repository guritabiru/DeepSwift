import UIKit

class ClassWithoutSingleton {
    var name: String = "Name Class Without Singleton"
}

// create instance
var classWithoutSingleton = ClassWithoutSingleton()
print(classWithoutSingleton.name)

class ClassWithSingleton {
    // create instance
    static let shared = ClassWithSingleton()
    
    var name: String = "Name Class With Singleton"
}

print(ClassWithSingleton.shared.name)
