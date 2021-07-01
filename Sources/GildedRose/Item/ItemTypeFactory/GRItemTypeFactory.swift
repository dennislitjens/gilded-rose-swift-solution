//
//  GRItemTypeBuilder.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//

public class GRItemTypeFactory: ItemTypeFactory {
    var itemDictionary: [ItemType: [String]] {
        return [
            .agedBrie: agedBrieNames,
            .legendaryItem: legendaryNames,
            .backstagePassItem: backstagePassNames,
            .conjuredItem: conjuredNames
        ]
    }
    
    public func itemType(forItem item: Item) -> ItemType {
        for itemType in itemDictionary {
            if itemType.value.contains(item.name) {
                return itemType.key
            }
        }
        return .normalItem
    }
    
    var agedBrieNames = [
        "Aged Brie"
    ]
    var legendaryNames = [
        "Sulfuras, Hand of Ragnaros"
    ]
    var backstagePassNames = [
        "Backstage passes to a TAFKAL80ETC concert"
    ]
    var conjuredNames = [
        "Conjured Mana Cake"
    ]
    
    public init() {}
}





