import UIKit
import Foundation

func printTitle(_ titleName: String, _ titleNumber: Int = 0, _ isSubTitle: Bool = false) {
    isSubTitle ? print("\n-- Sub: \(titleName) --") : print("\n\(titleNumber). \(titleName) ->\n")
}

/*
 1. Forced Unwrapping
 */
printTitle("Forced Unwrapping", 1)

func multiplier(_ number: Int) -> Int? {
    if number < 0 {
        return nil
    }
    return number * number
}
// Uncomment the statement below this line to get error
// multiplier(3) + 7

// Forced unwrapping to avoid the error, by adding "!" after function
multiplier(3)! + 7

/*
 2. Optional Binding
 */
printTitle("Optional Binding", 2)
printTitle("Optional Binding on if statement", 2, true)

if let result = multiplier(3) {
    result + 7
}

// multiple optional
if let x = multiplier(3), let y = multiplier(2), let z = multiplier(-1) {
    x + y + z
} else {
    print("there is nil value in above")
}


printTitle("Optional Binding on while statement", 2, true)

let numbers = [6, 3, 8, -1, 2, 1] // will be nil at index = 3
var index = 0
while let result = multiplier(numbers[index]) {
    index += 1
}

print(index)

/*
 3. Nil Coalescing
 - the syntax is someValue ?? defaultValue
 
 */
printTitle("Nil Coalescing", 3)
// without nil coalescing
if let result = multiplier(-7) {
    print(result)
} else {
    print(0)
}

// with nil coalescing
let resultCoalescing = multiplier(-7) ?? 0
print(resultCoalescing)


/*
 4. Guard
 */
printTitle("Guard", 4)

func multiplierWithGuard(_ number: Int?) -> Int? {
    guard let newNumber = number else {
        return nil
    }
    return newNumber * newNumber
}

print(multiplierWithGuard(nil))
print(multiplierWithGuard(2))
