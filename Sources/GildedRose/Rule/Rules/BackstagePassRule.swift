//
//  BackstagePassRule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

struct BackstagePassRule: Rule {
    var sellIn: Int
    var qualityOperation: QualityOperation {
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
