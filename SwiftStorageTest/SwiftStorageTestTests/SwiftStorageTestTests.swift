//
//  SwiftStorageTestTests.swift
//  SwiftStorageTestTests
//
//  Created by Ágnes Vásárhelyi on 31/08/14.
//  Copyright (c) 2014 Ágnes Vásárhelyi. All rights reserved.
//

import UIKit
import XCTest
@testable import SwiftStorageTest

class SwiftStorageTestTests: XCTestCase {

    func testSavingUserName() {
        let testName = "My favorite user"
        PersistentStorage.sharedInstance.userName = testName
       
        XCTAssertNotNil(PersistentStorage.sharedInstance.userName)
        XCTAssertEqual(PersistentStorage.sharedInstance.userName, testName, "Saving userName property succeeded")
    }
    
    func testSavingNumberOfAppLaunches() {
        let originalNumberOfAppLaunches = PersistentStorage.sharedInstance.numberOfAppLaunches
        PersistentStorage.sharedInstance.numberOfAppLaunches++
        
        XCTAssertEqual(PersistentStorage.sharedInstance.numberOfAppLaunches, originalNumberOfAppLaunches + 1, "Saving numberOfAppLaunches property succeeded")
    }
    
}
