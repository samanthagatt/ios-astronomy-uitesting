//
//  ImageCollectionPage.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class PhotosCollectionPage: TestPage {
    
    let testCase = XCTestCase()
    
    
    // MARK: - Elements
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var cellImageView: XCUIElement {
        return app.images["ImageCollectionViewCell.imageView"]
    }
    
    
    // MARK: - Actions
    
    
    
    
    // MARK: - Verifications
    
    
}
