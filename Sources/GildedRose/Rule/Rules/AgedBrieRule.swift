//
//  AgedBrieRule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

struct AgedBrieRule: Rule {
    var sellIn: Int = -1
    var qualityOperation: QualityOperation = .increases(with: 1)
    
    init() {}
}
