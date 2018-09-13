//
//  File.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
