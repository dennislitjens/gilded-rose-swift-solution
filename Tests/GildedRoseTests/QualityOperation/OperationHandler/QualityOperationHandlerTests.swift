//
//  File.swift
//  
//
//  Created by Dennis Litjens on 30/06/2021.
//
@testable import GildedRose
import XCTest

class QualityOperationHandlerTests: XCTestCase {
    
    private var qualityOperationHandler: QualityOperationHandler!
    
    override func setUp() {
        self.qualityOperationHandler = GRQualityOperationHandler(minQuality: 0, maxQuality: 50)
    }
    
    func testCalculateQualityReturnsSameValueWhenDoesNotChange() {
        let quality = self.qualityOperationHandler.calculateQuality(withQualityOperation: .doesNotChange, forQuality: 5)
        XCTAssertEqual(5, quality)
    }
    
    func testCalculateQualityReturns0WhenDropToZero() {
        let quality = self.qualityOperationHandler.calculateQuality(withQualityOperation: .dropToZero, forQuality: 5)
        XCTAssertEqual(0, quality)
    }
    
    func testCalculateQualityDegradesWithDegradeValueWhenDegrades() {
        let quality = self.qualityOperationHandler.calculateQuality(withQualityOperation: .degrades(with: 3), forQuality: 5)
        XCTAssertEqual(2, quality)
    }
    
    func testCalculateQualityIncreasesWithIncreaseValueWhenIncreases() {
        let quality = self.qualityOperationHandler.calculateQuality(withQualityOperation: .increases(with: 3), forQuality: 5)
        XCTAssertEqual(8, quality)
    }
    
    func testDegradeReturnsDegradedValueWhenItIsMoreThenMin() {
        let quality = self.qualityOperationHandler.degrade(4, withDegradeValue: 3)
        XCTAssertEqual(1, quality)
    }
    
    func testDegradeReturnsMinValueWhenDegradedQualityIsLess() {
        let quality = self.qualityOperationHandler.degrade(4, withDegradeValue: 5)
        XCTAssertEqual(0, quality)
    }
}
