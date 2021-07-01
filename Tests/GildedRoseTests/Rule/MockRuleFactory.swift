//
//  File.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

@testable import GildedRose

class MockRuleFactory: RuleFactory {
    
    public var calledMethods: [String] = []
    
    func createRule(forItem item: Item) -> Rule {
        calledMethods.append("createRule")
        return NormalItemRule(sellIn: 0)
    }
}
