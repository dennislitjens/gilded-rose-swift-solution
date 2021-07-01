public class GildedRose {
    var items:[Item]
    private var ruleFactory: RuleFactory
    private var qualityOperationHandler: QualityOperationHandler
    private var sellInRule: SellinRule
    
    public init(items:[Item], ruleFactory: RuleFactory, qualityOperationHandler: QualityOperationHandler, sellInRule: SellinRule) {
        self.items = items
        self.ruleFactory = ruleFactory
        self.sellInRule = sellInRule
        self.qualityOperationHandler = qualityOperationHandler
    }
    
    public func updateQuality() {
        for item in items {
            let rule = ruleFactory.createRule(forItem: item)
            item.quality = qualityOperationHandler.calculateQuality(
                withQualityOperation: rule.qualityOperation,
                forQuality: item.quality
            )
            item.sellIn = sellInRule.calculateSellIn(forItem: item)
        }
    }
}
