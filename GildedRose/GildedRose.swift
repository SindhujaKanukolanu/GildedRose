//
//  GildedRose.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

public class GildedRose {

    public static func updateItem(items: [Item]) -> [Item] {
        var items = items
        for index in 0 ..< items.count {
            items[index] = updateSellIn(for: items[index])
            items[index] = updateQuality(for: items[index])
        }
        return items
    }

    private static func updateSellIn(for item: Item) -> Item {
        var updatedItem: Item = item
        if updatedItem.name != ItemName.sulfuras.rawValue {
            updatedItem.sellIn -= 1
        }
        return updatedItem
    }

    private static func updateQuality(for item: Item) -> Item {
        var updatedItem = item
        switch updatedItem.name {
        case ItemName.agedBrie.rawValue:
            updatedItem = updateAgedBrieQuality(item: updatedItem)
        case ItemName.backStagePasses.rawValue:
            updatedItem = updateBackStagePassesQuality(item: updatedItem)
        case ItemName.sulfuras.rawValue:
            updatedItem.quality += 0
        case ItemName.conjured.rawValue:
            updatedItem = updateConjuredQuality(item: updatedItem)
        default:
            updatedItem = updateNormalItem(item: updatedItem)
        }
        return updatedItem
    }

    private static func updateAgedBrieQuality(item: Item) -> Item {
        var updatedItem = item
        if updatedItem.quality < 50 {
            updatedItem.quality += 1
        }
        return updatedItem
    }

    private static func updateConjuredQuality(item: Item) -> Item {
        var updatedItem = item
        updatedItem.quality -= 2
        if updatedItem.quality < 0 {
            updatedItem.quality = 0
        }
        return updatedItem
    }

    private static func updateBackStagePassesQuality(item: Item) -> Item {
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

    private static func updateNormalItem(item: Item) -> Item {
        var updatedItem = item
        if updatedItem.sellIn < 0 {
            updatedItem.quality -= 2
        } else {
            updatedItem.quality -= 1
        }
        if updatedItem.quality < 0 {
            updatedItem.quality = 0
        }
        return updatedItem
    }

}
