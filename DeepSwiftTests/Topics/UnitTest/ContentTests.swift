//
//  ContentTests.swift
//  DeepSwiftTests
//
//  Created by Bimo Sekti Wicaksono on 24/08/23.
//

import XCTest
@testable import DeepSwift

class ContentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMultipleSelf() throws {
        // Given (Arrange)
        let input = 5
        let expectedOutput = 25
        
        // When (Act)
        let multiple = Calculation().multipleSelf(number: input)
        
        
        // Then (Assert)
        XCTAssertEqual(multiple, expectedOutput, "Check input or expectedOutput or calculation")
    }

}
