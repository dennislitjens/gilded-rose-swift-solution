//
//  ItemsUtility.swift
//  
//
//  Created by Dennis Litjens on 28/06/2021.
//

public protocol ItemTypeFactory {
    func itemType(forItem item: Item) -> ItemType
}
