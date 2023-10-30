import UIKit

func printTitle(_ titleName: String, _ titleNumber: Int) {
    print("\n\(titleNumber). \(titleName) ->\n")
}

/*
 Enum expression syntax
 
 */


/*
 1. Basic Enum
 */
printTitle("Basic Enum", 1)

enum CompassPoint {
    case north
    case east
    case south
    case west
}

var directionToHead = CompassPoint.east
directionToHead = .north
switch directionToHead {
case .east:
    print("East")
case .west:
    print("West")
case .north:
    print("North")
case .south:
    print("South")
} // print: North


/*
 2. Enum Raw Value
 - Add raw value by adding an inheritance definition
 */
printTitle("Enum Raw Value", 2)

// inherit String so can get raw value
enum Time: String {
    case second
    case minute
    case hour
}
print(Time.minute.rawValue) // print: minute

// override the raw value
enum Date: String {
    case day = "Day"
    case month = "Month"
    case year = "Year"
}
print(Date.month.rawValue) // print: Month
