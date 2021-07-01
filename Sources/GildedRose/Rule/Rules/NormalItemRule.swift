//
//  NormalItemRule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

struct NormalItemRule: Rule {
    var sellIn: Int
    var qualityOperation: QualityOperation {
        let degradesWith = self.sellIn <= 0 ? 2 : 1
        return .degrades(with: degradesWith)
    }
}
