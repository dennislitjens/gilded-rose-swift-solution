@testable import GildedRose
import XCTest

class GildedRoseIntegrationTests: XCTestCase {
    
    private var app: GildedRose!
    
    override func setUp() {
        self.app = GildedRose(
            items: [],
            itemTypeFactory: GRItemTypeFactory(),
            ruleFactory: GRRuleFactory(),
            qualityOperationHandler: GRQualityOperationHandler(),
            sellInRule: GRSellinRule()
        )
    }
    
    func testFoo() {
        app.items = [Item(name: "foo", sellIn: 5, quality: 0)]
        XCTAssertEqual("foo", app.items[0].name)
    }
    
    //MARK: -- Normal items
    
    func testNormalItemReducesSellInBy1() {
        app.items = [Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 0)]
        app.updateQuality()
        XCTAssertEqual(4, app.items[0].sellIn)
    }
    
    func testNormalItemReducesQualityBy1() {
        app.items = [Item(name: "Elixir of the Mongoose", sellIn: 1, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(4, app.items[0].quality)
    }
    
    func testNormalItemSellInDatePassedDegradesQualityTwiceAsFast() {
        app.items = [Item(name: "Elixir of the Mongoose", sellIn: 0, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(3, app.items[0].quality)
        app.updateQuality()
        XCTAssertEqual(1, app.items[0].quality)
    }
    
    func testQualityIsNeverBelowZero() {
        app.items = [Item(name: "Elixir of the Mongoose", sellIn: 1, quality: 5)]
        app.updateQuality()
        app.updateQuality()
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(0, app.items[0].quality)
    }
    
    func testQualityIsNeverBelowZeroWhenQualityIs1ButDegradesWith2() {
        app.items = [Item(name: "Elixir of the Mongoose", sellIn: -1, quality: 1)]
        app.updateQuality()
        XCTAssertEqual(0, app.items[0].quality)
    }
    
    //MARK: -- AgedBrie
    
    func testBrieIncreasesInQuality() {
        app.items = [Item(name: "Aged Brie", sellIn: 5, quality: 1)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(3, app.items[0].quality)
    }
    
    func testAgedBrieQualityNeverAbove50() {
        app.items = [Item(name: "Aged Brie", sellIn: 5, quality: 49)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testAgedBrieQualityNeverAbove50WhenStartingWith50() {
        app.items = [Item(name: "Aged Brie", sellIn: 5, quality: 50)]
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    //MARK: -- Sulfuras Legendary item
    
    func testSulfurasNeverDecreasesQuality() {
        app.items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(5, app.items[0].quality)
        app.items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80)]
        app.updateQuality()
        XCTAssertEqual(80, app.items[0].quality)
    }
    
    func testSulfurasNeverDecreasesSellIn() {
        app.items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(5, app.items[0].sellIn)
    }

    //MARK: -- BackstagePasses
    
    func testBackstagePassIncreasesQualityBy1WhenMoreThen10SellinDays() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 20, quality: 1)]
        app.updateQuality()
        XCTAssertEqual(2, app.items[0].quality)
    }
    
    func testBackstagePassIncreasesQualityBy2When10DaysOrLess() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 6)]
        app.updateQuality()
        XCTAssertEqual(8, app.items[0].quality)
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(12, app.items[0].quality)
    }
    
    func testBackstagePassIncreasesQualityBy3When5DaysOrLess() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 6)]
        app.updateQuality()
        XCTAssertEqual(9, app.items[0].quality)
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(15, app.items[0].quality)
    }
    
    func testBackstagePassQualityIsZeroWhenConcertIsPassed() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 40)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(0, app.items[0].quality)
    }
    
    func testBackstagePassesQualityNeverAbove50() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 49)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testBackstagePassesQualityNeverAbove50WhenStartingWith50() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 50)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testBackStagePassesQualityNeverAbove50WhenQualityIs50AndIncreasesWith3() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 48)]
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    func testBackStagePassesQualityNeverAbove50WhenQualityIs49AndIncreasesWith2() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49)]
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality)
    }
    
    //MARK: -- Conjured Items
    
    func testConjuredItemsDegradeWith4WhenSellinIsPassed() {
        app.items = [Item(name: "Conjured Mana Cake", sellIn: -1, quality: 8)]
        app.updateQuality()
        XCTAssertEqual(4, app.items[0].quality)
    }
    
    func testConjuredItemsDegradeWith2WhenSellinIsNotPassed() {
        app.items = [Item(name: "Conjured Mana Cake", sellIn: 1, quality: 8)]
        app.updateQuality()
        XCTAssertEqual(6, app.items[0].quality)
    }

    static var allTests : [(String, (GildedRoseIntegrationTests) -> () throws -> Void)] {
        return [
            ("testFoo", testFoo),
        ]
    }
}
