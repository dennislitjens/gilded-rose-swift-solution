//
//  Rule.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol Rule {
    var sellIn: Int { get }
    var qualityOperation: QualityOperation { get }
}
