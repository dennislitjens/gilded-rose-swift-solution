public class GildedRose {
    var items:[Item]
    
    private var itemTypeFactory: ItemTypeFactory
    private var ruleFactory: RuleFactory
    private var qualityOperationHandler: QualityOperationHandler
    private var sellInRule: SellinRule
    
    public init(items:[Item], itemTypeFactory: ItemTypeFactory, ruleFactory: RuleFactory, qualityOperationHandler: QualityOperationHandler, sellInRule: SellinRule) {
        self.items = items
        self.itemTypeFactory = itemTypeFactory
        self.ruleFactory = ruleFactory
        self.sellInRule = sellInRule
        self.qualityOperationHandler = qualityOperationHandler
    }
    
    public func updateQuality() {
        for item in items {
            let itemType = itemTypeFactory.itemType(forItem: item)
            let rule = ruleFactory.createRule(forItemType: itemType, withSellIn: item.sellIn)
            item.quality = qualityOperationHandler.calculateQuality(
                withQualityOperation: rule.qualityOperation,
                forQuality: item.quality
            )
            item.sellIn = sellInRule.calculateSellIn(forItemType: itemType, withSellin: item.sellIn)
        }
    }
}
