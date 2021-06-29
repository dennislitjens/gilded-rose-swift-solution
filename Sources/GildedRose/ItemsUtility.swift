//
//  File.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

extension Item {
    func isTypeOff() -> ItemType {
        return ItemType(rawValue: self.name) ?? .normalItem
    }
    
    func isQualityOperation() -> QualityOperation {
        switch self.isTypeOff() {
        case .agedBrie:
            return .increases(with: 1)
        case .normalItem:
            let degradesWith = self.sellIn <= 0 ? 2 : 1
            return .degrades(with: degradesWith)
        case .sulfurasHandOfRagnaros:
            return .doesNotChange
        case .backstagePassTAFKAL80ETC:
            if self.sellIn < 0 {
                return .dropToZero
            } else if self.sellIn <= 5 {
                return .increases(with: 3)
            } else if self.sellIn <= 10 {
                return .increases(with: 2)
            } else {
                return .increases(with: 1)
        }
        }
    }
}

enum ItemType: String {
    case agedBrie = "Aged Brie"
    case sulfurasHandOfRagnaros = "Sulfuras, Hand of Ragnaros"
    case backstagePassTAFKAL80ETC = "Backstage passes to a TAFKAL80ETC concert"
    case normalItem
}

enum QualityOperation {
    case degrades(with: Int)
    case increases(with: Int)
    case dropToZero
    case doesNotChange
}


