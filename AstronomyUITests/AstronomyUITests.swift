//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    
}
