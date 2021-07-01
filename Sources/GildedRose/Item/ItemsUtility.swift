//
//  ItemsUtility.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

extension Item {
    func isTypeOff() -> ItemType {
        return ItemType(rawValue: self.name) ?? .normalItem
    }
}

enum ItemType: String {
    case agedBrie = "Aged Brie"
    case sulfurasHandOfRagnaros = "Sulfuras, Hand of Ragnaros"
    case backstagePassTAFKAL80ETC = "Backstage passes to a TAFKAL80ETC concert"
    case conjuredItem = "Conjured Mana Cake"
    case normalItem
    
    
}




