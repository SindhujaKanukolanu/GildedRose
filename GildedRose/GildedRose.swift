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
            updatedItem = AgedBrieQuality.updateAgedBrieQuality(item: updatedItem)
        case ItemName.backStagePasses.rawValue:
            updatedItem = BackStagePassesQuality.updateBackStagePassesQuality(item: updatedItem)
        case ItemName.sulfuras.rawValue:
            updatedItem.quality += 0
        case ItemName.conjured.rawValue:
            updatedItem = ConjuredQuality.updateConjuredQuality(item: updatedItem)
        default:
            updatedItem = NormalItemQuality.updateNormalItem(item: updatedItem)
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

}
