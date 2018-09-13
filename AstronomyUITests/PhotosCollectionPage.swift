//
//  ImageCollectionPage.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class PhotosCollectionPage: TestPage {
    
    init(testCase: XCTestCase, storedTitle: String? = nil) {
        self.testCase = testCase
        self.storedTitle = storedTitle
    }
    
    
    let testCase: XCTestCase
    
    
    // MARK: - Elements
    
    func collectionCell(at index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var title: String {
        return app.navigationBars.element(boundBy: 0).identifier
    }
    
    var storedTitle: String?
    
    
    // MARK: - Actions
    
    @discardableResult func sleep(_ int: UInt32, file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        return self
    }
    
    @discardableResult func tapOnNextSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        testCase.expect(exists: nextSolButton, file: file, line: line)
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnPreviousSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        testCase.expect(exists: previousSolButton, file: file, line: line)
        previousSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnCollectionCell(at index: Int, file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        let cell = collectionCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return self
    }
    
    @discardableResult func storeTitle(file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        storedTitle = title
        return self
    }
    
    
    // MARK: - Verifications
    
    @discardableResult func verifyTitleChanges(file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        testCase.expect(notNil: storedTitle, file: file, line: line)
        testCase.expect(storedTitle, notEquals: title, file: file, line: line)
        return self
    }
}
