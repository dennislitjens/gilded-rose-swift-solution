//
//  File.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose

class MockRuleFactory: RuleFactory {

    public var calledMethods: [String] = []
    
    func createRule(forItemType itemType: ItemType, withSellIn: Int) -> Rule {
        calledMethods.append("createRule")
        return NormalItemRule(sellIn: 0)
    }
}
