//
//  NormalItemQuality.swift
//  GildedRose
//
//  Created by I308888 on 26/04/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import Foundation

public class NormalItemQuality {

     static func updateNormalItem(item: Item) -> Item {
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
