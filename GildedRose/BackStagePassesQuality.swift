//
//  BackStagePassesQuality.swift
//  GildedRose
//
//  Created by I308888 on 26/04/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import Foundation

public class BackStagePassesQuality {

    static func updateBackStagePassesQuality(item: Item) -> Item {
        var updatedItem = item
        updatedItem.quality += 1
        if isSellin10daysOrLess(item: updatedItem) {
            updatedItem.quality += 1
        }
        if isSellin5daysOrLess(item: updatedItem) {
            updatedItem.quality += 2
        }
        if updatedItem.sellIn < 0 {
            updatedItem.quality = 0
        }
        if updatedItem.quality > 50 {
            updatedItem.quality = 50
        }
        return updatedItem
    }

    private static func isSellin10daysOrLess(item: Item) -> Bool {
        return item.sellIn <= 10 && item.sellIn > 5
    }

    private static func isSellin5daysOrLess(item: Item) -> Bool {
        return item.sellIn <= 5 && item.sellIn >= 0
    }

}
