//
//  File.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//

@testable import GildedRose

class MockItemTypeFactory: ItemTypeFactory {
    
    var calledMethods: [String] = []
    
    func itemType(forItem item: Item) -> ItemType {
        calledMethods.append("itemType(forItem)")
        return .normalItem
    }
}
