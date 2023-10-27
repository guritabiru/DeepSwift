import UIKit

/*
 Closure expression syntax
 
 { (parameters) -> return type in
    statements
 }
 
 */


/*
 1. Basic Closure
 */
//print("\n \n")
print("1. Basic Closure ->")

let integerMultiplier = { (input: Int) -> Int in
    return input * 2
}
let value = 4
let multipliedValue = integerMultiplier(value)
print(multipliedValue)


/*
 2. Omitting Closure
 */
print("\n \n")
print("2. Omitting Closure ->")

// omitting return type
let integerMultiplier1 = { (input: Int) in
    return input * 2
}

// omitting parameter type
let integerMultiplier2 = { (input) in
    return input * 2
}

// omitting return and parentheses
let integerMultiplier3 = { input in
    input * 2
}

// shorthand argument 1
let integerMultiplier4 = {
    $0 * 2
}

// shorthand argument 2
let sortedIntegers = [2, 1, 5, 3].sorted { (lhs, rhs) -> Bool in
    return lhs < rhs
}
print(sortedIntegers)

let sortedIntegers2 = [2, 1, 5, 3].sorted {
    $0 < $1
    // $0 is first parameter, $1 is second parameter and so on
}
print(sortedIntegers2)


/*
 3. Trailing Closure
 */
print("\n \n")
print("3. Trailing Closure ->")

func someCalculation(number: Int, completion: (_ success: Bool) -> Void) {
    // some statements
    completion(true)
}

// basic closure
someCalculation(number: 0, completion: { success in
    print("Calculation is \(success)")
})

// trailing closure
someCalculation(number: 0) { success in
    print("Calculation is \(success)")
}

// trailing closure with shorthand argument
someCalculation(number: 0) {
    print("Calculation is \($0)")
}


/*
 4. Capturing values in a closure
 */
print("\n \n")
print("4. Capturing values in a closure ->")


/*
 5. Escaping Closure
 */
print("\n \n")
print("5. Escaping Closure ->")


/*
 6. Autoclosure
 */
print("\n \n")
print("6. Autoclosure ->")
