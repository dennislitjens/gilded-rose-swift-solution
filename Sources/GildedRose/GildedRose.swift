public class GildedRose {
    var items:[Item]
    
    let MIN_QUALITY = 0
    let MAX_QUALITY = 50
    
    public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            item.quality = self.calculateQualityFor(
                qualityOperation: item.isQualityOperation(),
                from: item.quality
            )
            item.sellIn = self.calculateSellIn(forItem: item)
        }
    }
    
    private func calculateQualityFor(qualityOperation: QualityOperation, from quality: Int) -> Int {
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
    
    private func calculateSellIn(forItem item: Item) -> Int {
        if item.sellIn >= 0 && item.isTypeOff() != .sulfurasHandOfRagnaros {
            return item.sellIn - 1
        }
        return item.sellIn
    }
    
    private func degrade(_ quality: Int, withDegradeValue degradeValue: Int) -> Int {
        return quality - degradeValue >= MIN_QUALITY ? quality - degradeValue : MIN_QUALITY
    }
    
    private func increase(_ quality: Int, withIncreaseValue increaseValue: Int) -> Int {
        return quality + increaseValue <= MAX_QUALITY ? quality + increaseValue : MAX_QUALITY
    }
}
