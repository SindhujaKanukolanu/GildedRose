//
//  ConjuredTests.swift
//  GildedRoseTests
//
//  Created by Raghu, Reshma L on 4/20/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class ConjuredTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func testConjuredItem() {
		let input = Item(name: ItemName.conjured.rawValue, sellIn: 10, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.conjured.rawValue, sellIn: 9, quality: 8)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testConjuredOnLastSellinDay() {
		let input = Item(name: ItemName.conjured.rawValue, sellIn: 0, quality: 11)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.conjured.rawValue, sellIn: -1, quality: 9)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testConjuredOnZeroQuality() {
		let input = Item(name: ItemName.conjured.rawValue, sellIn: 0, quality: 0)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.conjured.rawValue, sellIn: -1, quality: 0)
		XCTAssertEqual(updatedItem, expectedItem)
	}

}
