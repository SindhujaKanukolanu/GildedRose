//
//  UpdatedGildedRoseTest.swift
//  GildedRoseTests
//
//  Created by Raghu, Reshma L on 4/20/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class UpdatedGildedRoseTest: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
	func testNormalItem() {
		let input = Item(name: "Normal", sellIn: 10, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: "Normal", sellIn: 9, quality: 9)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testNormalItemOnLastSellinDay() {
		let input = Item(name: "Normal", sellIn: 0, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: "Normal", sellIn: -1, quality: 8)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testNormalItemOnBeyondSellinDay() {
		let input = Item(name: "Normal", sellIn: -1, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: "Normal", sellIn: -2, quality: 8)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testNormalItemOnMaxQuality() {
		let input = Item(name: "Normal", sellIn: 10, quality: 50)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: "Normal", sellIn: 9, quality: 49)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testNormalItemOnZeroQuality() {
		let input = Item(name: "Normal", sellIn: 10, quality: 0)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: "Normal", sellIn: 9, quality: 0)
		XCTAssertEqual(updatedItem, expectedItem)
	}
}
