//
//  Item.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public struct Item: Equatable {
    var name: String
    var sellIn: Int
    var quality: Int
}

public enum ItemName: String {
	case agedBrie = "Aged Brie"
	case backStagePasses = "Backstage passes to a TAFKAL80ETC concert"
	case sulfuras =  "Sulfuras, Hand of Ragnaros"
	case conjured = "Conjured"
}

public func == (lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name && lhs.sellIn == rhs.sellIn && lhs.quality == rhs.quality
}
