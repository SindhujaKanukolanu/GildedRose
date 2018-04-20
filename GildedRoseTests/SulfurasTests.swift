//
//  SulfurasTests.swift
//  GildedRoseTests
//
//  Created by Raghu, Reshma L on 4/20/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class SulfurasTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func testSulfurasItem() {
		let input = Item(name: ItemName.sulfuras.rawValue, sellIn: 10, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.sulfuras.rawValue, sellIn: 10, quality: 10)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testSulfurasOnLastSellinDay() {
		let input = Item(name: ItemName.sulfuras.rawValue, sellIn: 0, quality: 11)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.sulfuras.rawValue, sellIn: 0, quality: 11)
		XCTAssertEqual(updatedItem, expectedItem)
	}
}
