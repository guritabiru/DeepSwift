//
//  ExtensionUnitTest.swift
//  DeepSwiftTests
//
//  Created by Bimo Sekti Wicaksono on 07/11/23.
//

import Foundation
import XCTest

extension XCTestCase {
    func testPotentialMemoryLeaks(
        _ instance: AnyObject,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance,
                "Potential memory leak, this object should have been deallocated ⚠️",
                file: file,
                line: line
            )
        }
    }
}
