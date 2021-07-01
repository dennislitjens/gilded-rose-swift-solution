//
//  ConjuredItemRule.swift
//  
//
//  Created by Dennis Litjens on 01/07/2021.
//

struct ConjuredItemRule: Rule {
    var sellIn: Int
    var qualityOperation: QualityOperation {
        let degradesWith = self.sellIn <= 0 ? 4 : 2
        return .degrades(with: degradesWith)
    }
}
