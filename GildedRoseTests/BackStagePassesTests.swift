//
//  BackStagePassesTests.swift
//  GildedRoseTests
//
//  Created by Raghu, Reshma L on 4/20/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import XCTest
@testable import GildedRose

class BackStagePassesTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func testBackStagePassesItem() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 20, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 19, quality: 11)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePasses10Days() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 11, quality: 15)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 10, quality: 17)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePassesLesserThan10Days() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 10, quality: 15)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 9, quality: 17)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePasses5Days() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 6, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 5, quality: 13)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePassesLesserThan5Days() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 5, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 4, quality: 13)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePassesOnMaxQuality() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 10, quality: 50)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: 9, quality: 50)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePassesOnZeroSellin() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: 0, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: -1, quality: 0)
		XCTAssertEqual(updatedItem, expectedItem)
	}

	func testBackStagePassesOnNegativeSellin() {
		let input = Item(name: ItemName.backStagePasses.rawValue, sellIn: -1, quality: 10)
		let updatedItem = GildedRose.updateItem(items: [input])[0]

		let expectedItem = Item(name: ItemName.backStagePasses.rawValue, sellIn: -2, quality: 0)
		XCTAssertEqual(updatedItem, expectedItem)
	}

}
