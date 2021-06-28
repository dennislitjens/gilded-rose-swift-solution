@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    private var app: GildedRose!
    
    override func setUp() {
        self.app = GildedRose(items: [])
    }
    
    func testFoo() {
        app.items = [Item(name: "foo", sellIn: 5, quality: 0)]
        XCTAssertEqual("foo", app.items[0].name)
    }
    
    func testReducesSellInBy1() {
        app.items = [Item(name: "foo", sellIn: 5, quality: 0)]
        app.updateQuality()
        XCTAssertEqual(4, app.items[0].sellIn);
    }
    
    func testReducesQualityBy1() {
        app.items = [Item(name: "foo", sellIn: 1, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(4, app.items[0].quality);
    }
    
    func testSellInDatePassedDegradesQualityTwiceAsFast() {
        app.items = [Item(name: "foo", sellIn: 0, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(3, app.items[0].quality);
        app.updateQuality()
        XCTAssertEqual(1, app.items[0].quality);
    }
    
    func testQualityIsNeverBelowZero() {
        app.items = [Item(name: "foo", sellIn: 1, quality: 2)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(0, app.items[0].quality);
    }
    
    func testBrieIncreasesInQuality() {
        app.items = [Item(name: "Aged Brie", sellIn: 5, quality: 1)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(3, app.items[0].quality);
    }
    
    func testQualityNeverAbove50() {
        app.items = [Item(name: "Aged Brie", sellIn: 5, quality: 49)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(50, app.items[0].quality);
    }
    
    func testSulfurasNeverDecreasesQuality() {
        app.items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 5)]
        app.updateQuality()
        XCTAssertEqual(5, app.items[0].quality);
        app.items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 5, quality: 80)]
        app.updateQuality()
        XCTAssertEqual(80, app.items[0].quality);
    }
    
    func testBackstagePassIncreasesQualityBy2When10DaysOrLess() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 6)]
        app.updateQuality()
        XCTAssertEqual(8, app.items[0].quality);
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(12, app.items[0].quality);
    }
    
    func testBackstagePassIncreasesQualityBy2When5DaysOrLess() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 6)]
        app.updateQuality()
        XCTAssertEqual(9, app.items[0].quality);
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(15, app.items[0].quality);
    }
    
    func testBackstagePassQualityIsZeroWhenConcertIsPassed() {
        app.items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 1, quality: 40)]
        app.updateQuality()
        app.updateQuality()
        XCTAssertEqual(0, app.items[0].quality);
    }

    static var allTests : [(String, (GildedRoseTests) -> () throws -> Void)] {
        return [
            ("testFoo", testFoo),
        ]
    }
}
