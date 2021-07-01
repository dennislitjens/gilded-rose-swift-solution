//
//  QualityOperationHandler.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public protocol QualityOperationHandler {
    var MIN_QUALITY: Int { get }
    var MAX_QUALITY: Int { get }
    func calculateQuality(withQualityOperation qualityOperation: QualityOperation, forQuality quality: Int) -> Int
    func degrade(_ quality: Int, withDegradeValue degradeValue: Int) -> Int
    func increase(_ quality: Int, withIncreaseValue increaseValue: Int) -> Int
}
