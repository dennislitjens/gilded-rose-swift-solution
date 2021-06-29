public class GildedRose {
    var items:[Item]
    
    public init(items:[Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            switch item.isQualityOperation() {
            case .doesNotChange:
                return
            case .dropToZero:
                item.quality = 0
            case .degrades(let degradeValue):
                if item.quality - degradeValue >= 0 {
                    item.quality -= degradeValue
                } else {
                    item.quality = 0
                }
            case .increases(let increaseValue):
                if item.quality + increaseValue <= 50 {
                    item.quality += increaseValue
                } else {
                    item.quality = 50
                }
            }
            
            if item.sellIn >= 0 {
                item.sellIn -= 1
            }
        }
    }
}
