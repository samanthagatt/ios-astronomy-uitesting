//
//  File.swift
//  AstronomyUITests
//
//  Created by Samantha Gatt on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

extension XCTestCase {
    
    // MARK: - Throws
    
    func shouldNotThrow(file: String, line: UInt, _ block: () throws -> Void) {
        do {
            _ = try block()
        } catch {
            recordFailure(withDescription: "Boo! \(error)", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func shouldThrow(file: String, line: UInt, _ block: () throws -> Void) {
        do {
            _ = try block()
            recordFailure(withDescription: "Should have thrown!", inFile: file, atLine: Int(line), expected: true)
        } catch {
        }
    }
    
    // MARK: - Equals
    
    func expect(nil expression: @autoclosure () -> Any?, file: String, line: UInt) {
        if let it = expression() {
            recordFailure(withDescription: "Expected '\(it)' to be nil.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(notNil expression: @autoclosure () -> Any?, file: String, line: UInt) {
        if expression() == nil {
            recordFailure(withDescription: "Expected this not to be nil.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(exists element: XCUIElement, file: String, line: UInt) {
        if !element.exists {
            recordFailure(withDescription: "Expected \(element) to exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(doesNotExist element: XCUIElement, file: String, line: UInt) {
        if element.exists {
            recordFailure(withDescription: "Expected \(element) to not exist.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(false expression: @autoclosure () -> Bool?, file: String, line: UInt) {
        guard let actual = expression() else {
            recordFailure(withDescription: "Expected 'nil' to be false.", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if actual != false {
            recordFailure(withDescription: "Expected this to be false.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(true expression: @autoclosure () -> Bool?, file: String, line: UInt) {
        guard let actual = expression() else {
            recordFailure(withDescription: "Expected 'nil' to be true.", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if actual != true {
            recordFailure(withDescription: "Expected this to be true.", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect<T: Equatable>(_ this: @autoclosure () -> T?, equals expression: @autoclosure () -> T?, file: String, line: UInt) {
        let actual = this()
        let expected = expression()
        if !equals(actual, expected) {
            recordFailure(withDescription: "Expected '\(String(describing: actual))' to equal '\(String(describing: expected))]", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect<T: Equatable>(_ this: @autoclosure () -> T?, notEquals expression: @autoclosure () -> T?, file: String, line: UInt) {
        let actual = this()
        let expected = expression()
        if equals(actual, expected) {
            recordFailure(withDescription: "Expected '\(String(describing: actual))' to not equal '\(String(describing: expected))]", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(date thisDate: Date?, equals thatDate: Date?, downToThe component: Calendar.Component = .second, file: String, line: UInt) {
        guard let thisDate = thisDate, let thatDate = thatDate else {
            recordFailure(withDescription: "Expected dates to not be nil", inFile: file, atLine: Int(line), expected: true)
            return
        }
        if !Calendar.current.isDate(thisDate, equalTo: thatDate, toGranularity: component) {
            recordFailure(withDescription: "Expected \(thisDate) to equal: \(thatDate)", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    
    // MARK: - Contains
    
    func expect(_ actual: String, contains expected: String..., file: String, line: UInt) {
        let result = expected.map { actual.contains($0) }
        if let index = result.index(of: false) {
            recordFailure(withDescription: "Expected \(actual) to contain \(expected[index])", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    func expect(_ actual: String, doesNotContain expected: String..., file: String, line: UInt) {
        let result = expected.map { actual.contains($0) }
        if let index = result.index(of: true) {
            recordFailure(withDescription: "Expected \(actual) to not contain \(expected[index])", inFile: file, atLine: Int(line), expected: true)
        }
    }
    
    // MARK: - Private Methods
    
    private func equals<T: Equatable>(_ lhs: T?, _ rhs: T?) -> Bool {
        if lhs == nil && rhs == nil {
            return true
        }
        guard let actual = lhs, let expected = rhs else {
            return false
        }
        return actual == expected
    }
}
