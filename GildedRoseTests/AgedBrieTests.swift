//
//  AgedBrieTests.swift
//  GildedRoseTests
//
//  Created by Raghu, Reshma L on 4/20/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class AgedBrieTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
	func testAgedBrieItem() {
		let input = Item(name: ItemName.agedBrie.rawValue, sellIn: 10, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.agedBrie.rawValue, sellIn: 9, quality: 11)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testAgedBrieOnLastSellinDay() {
		let input = Item(name: ItemName.agedBrie.rawValue, sellIn: 0, quality: 11)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.agedBrie.rawValue, sellIn: -1, quality: 12)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testAgedBrieOnBeyondSellinDay() {
		let input = Item(name: ItemName.agedBrie.rawValue, sellIn: -1, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.agedBrie.rawValue, sellIn: -2, quality: 11)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testAgedBrieOnMaxQuality() {
		let input = Item(name: ItemName.agedBrie.rawValue, sellIn: 10, quality: 50)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.agedBrie.rawValue, sellIn: 9, quality: 50)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testAgedBrieOnZeroQuality() {
		let input = Item(name: ItemName.agedBrie.rawValue, sellIn: 10, quality: 0)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.agedBrie.rawValue, sellIn: 9, quality: 1)
		XCTAssertEqual(updatedItem, expectedItem)
	}
}
