@testable import AwareSDK
import XCTest

class ItemEventTest: XCTestCase {
  let ITEM = ItemEventItem(
    id: "test-id",
    title: "test-title",
    originalPrice: 10000,
    price: 10000,
    categoryName: "test-category-name",
    brandName: "test-brand-name",
    imageUrl: "test-image-url",
    outOfStock: false
  )
  let DATE = Date()

  var uut: ItemEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = ItemEvent(item: ITEM, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "item",
        "timestamp": DATE.timestamp,
        "item": ITEM.toItemField(),
      ]
    )
  }
}
