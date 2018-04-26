//
//  AgedBrieQuality.swift
//  GildedRose
//
//  Created by I308888 on 26/04/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import Foundation

public class AgedBrieQuality {

     static func updateAgedBrieQuality(item: Item) -> Item {
        var updatedItem = item
        if updatedItem.quality < 50 {
            updatedItem.quality += 1
        }
        return updatedItem
    }

}
