//
//  ImageCollectionPage.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotosCollectionPage: TestPage {
    
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
        return app.title
    }
    
    
    // MARK: - Actions
    
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
    
    
    // MARK: - Verifications
    
    // don't know how I'd have access to the previous title but I'll worry about that later
    @discardableResult func verifyTitleChanges(prevTitle: String, file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        testCase.expect(prevTitle, equals: title, file: file, line: line)
        return self
    }
}
