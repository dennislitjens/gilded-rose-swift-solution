//
//  GRQualityOperationHandler.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//

public class GRQualityOperationHandler: QualityOperationHandler {
    
    public var MIN_QUALITY: Int
    public var MAX_QUALITY: Int
    
    public init(minQuality: Int = 0, maxQuality: Int = 50) {
        self.MIN_QUALITY = minQuality
        self.MAX_QUALITY = maxQuality
    }
    
    public func calculateQuality(withQualityOperation qualityOperation: QualityOperation, forQuality quality: Int) -> Int {
        switch qualityOperation {
        case .doesNotChange:
            return quality
        case .dropToZero:
            return 0
        case .degrades(let degradeValue):
            return self.degrade(quality, withDegradeValue: degradeValue)
        case .increases(let increaseValue):
            return self.increase(quality, withIncreaseValue: increaseValue)
        }
    }
    
    public func degrade(_ quality: Int, withDegradeValue degradeValue: Int) -> Int {
        return max(quality - degradeValue, MIN_QUALITY)
    }
    
    public func increase(_ quality: Int, withIncreaseValue increaseValue: Int) -> Int {
        return min(quality + increaseValue, MAX_QUALITY)
    }
}
