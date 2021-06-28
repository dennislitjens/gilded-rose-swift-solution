//
//  File.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

extension Item {
    func isTypeOff() -> ItemType {
        return ItemType(rawValue: self.name) ?? .notImplemented
    }
}

enum ItemType: String {
    case dexterityVest = "+5 Dexterity Vest"
    case agedBrie = "Aged Brie"
    case elixirOfTheMongoose = "Elixir of the Mongoose"
    case sulfurasHandOfRagnaros = "Sulfuras, Hand of Ragnaros"
    case backstagePassTAFKAL80ETC = "Backstage passes to a TAFKAL80ETC concert"
    case conjuredManaCake = "Conjured Mana Cake"
    case notImplemented
}
