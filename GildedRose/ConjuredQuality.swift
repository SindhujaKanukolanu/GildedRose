//
//  ConjuredQuality.swift
//  GildedRose
//
//  Created by I308888 on 26/04/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import Foundation

public class ConjuredQuality {

     static func updateConjuredQuality(item: Item) -> Item {
        var updatedItem = item
        updatedItem.quality -= 2
        if updatedItem.quality < 0 {
            updatedItem.quality = 0
        }
        return updatedItem
    }

}
