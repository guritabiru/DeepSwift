import UIKit

func printTitle(_ titleName: String, _ titleNumber: Int = 0, _ isSubTitle: Bool = false) {
    isSubTitle ? print("\n-- Sub: \(titleName) --") : print("\n\(titleNumber). \(titleName) ->\n")
}

/*
 1. ARC Definitions
 - ARC automatically frees up the memory used by class instances when those instances are no longer needed.
 - In a few cases ARC requires more information about the relationships (strong/weak/unowned) between parts of your code in order to manage memory for you
 */
printTitle("ARC Definitions", 1)

class Customer {
    let udid: String
    let name: String
    
    init(udid: String, name: String) {
        self.udid = udid
        self.name = name
        
        print("\(udid) initialized")
    }
    
    deinit {
        print("\n\(udid) deinitialized")
    }
}

// Global strong reference. It will free up at the end of program cycle
printTitle("Global Strong Reference",0,true)
var customer: Customer? = nil
customer = Customer(udid: "global reference", name: "John")
customer = nil

// Function strong reference. It will free up at the end of function
printTitle("Function Strong Reference",0,true)
func printCustomer() {
    let customer = Customer(udid: "function reference", name: "Mike")
    
    print("print customer: \(customer.udid)")
}

printCustomer()

// Loop strong reference. It will free up at the end of function
printTitle("Loop Strong Reference",0,true)

for i in 1..<5 {
    _ = Customer(udid: "loop \(i)", name: "Steven")
}

/*
 2. Strong Reference
 */
printTitle("Strong Reference", 2)

// EXAMPLE 1
// create strong reference counting
var customer1stRef: Customer? = nil
var customer2ndRef: Customer? = nil

customer1stRef = Customer(udid: "strong 1st", name: "Max")

customer2ndRef = customer1stRef // customer2ndRef has strong reference to customer1stRef
print("strong 1st: \(customer1stRef?.udid ?? "")")
print("strong 2nd: \(customer2ndRef?.udid ?? "")")

customer1stRef = nil
// customer1stRef wouldn't deallocated because it has strong reference with customer2ndRef

// deinit customer2ndRef to deallocate customer1stRef
customer2ndRef = nil

/*
 3. Weak Reference
 */
printTitle("Weak Reference", 3)

// EXAMPLE 1
printTitle("EXAMPLE 1",0,true)
weak var weakCustomer1stRef: Customer? = nil
weak var weakCustomer2ndRef: Customer? = nil

weakCustomer1stRef = Customer(udid: "weak 1", name: "Lila")
// Instance will be immediately deallocated because variable 'weakCustomer1stRef' is 'weak'


var strongCustomerRef: Customer? = Customer(udid: "strong1", name: "Klo")

weakCustomer1stRef = strongCustomerRef
weakCustomer2ndRef = weakCustomer1stRef

print("weak 1st: \(String(describing: weakCustomer1stRef?.udid))")
print("weak 2nd: \(String(describing: weakCustomer2ndRef?.udid))")

strongCustomerRef = nil

print("weak 1st: \(String(describing: weakCustomer1stRef?.udid))")
print("weak 2nd: \(String(describing: weakCustomer2ndRef?.udid))")

// EXAMPLE 2
printTitle("EXAMPLE 2",0,true)

class PersonWeak {
    var name: String
    var apartment: ApartmentWeak?
    
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

class ApartmentWeak {
    let unit: String
    weak var tenant: PersonWeak?
    
    init(unit: String) {
        self.unit = unit
    }
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}

var john: PersonWeak?
var unit4A: ApartmentWeak?

john = PersonWeak(name: "John")
unit4A = ApartmentWeak(unit: "Unit4A")

john!.apartment = unit4A
unit4A!.tenant = john

//unit4A = nil // cannot deinit
john = nil
unit4A = nil // can deinit


/*
 4. Unowned Reference
 */
printTitle("Unowned Reference", 4)


// EXAMPLE 1
printTitle("EXAMPLE 1",0,true)

class Owner {
    let udid: String
    let name: String
    var business: Business!
    
    init(udid: String, name: String) {
        self.udid = udid
        self.name = name
    }
    
    deinit {print("Owner \(udid) is being deinit")}
}

class Business {
    let title: String
    unowned let owner: Owner // Unowned reference always have a value
    
    init(title: String, owner: Owner) {
        self.title = title
        self.owner = owner
    }
    
    deinit {print("Business \(title) is being deinit")}
}

var owner: Owner? = Owner(udid: "unowned reference", name: "owner")
owner!.business = Business(title: "Corp", owner: owner!)
print(owner!.udid)
print(owner!.business.title)

// EXAMPLE 2
printTitle("EXAMPLE 2",0,true)
