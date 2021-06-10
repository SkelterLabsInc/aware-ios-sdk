@testable import AwareSDK
import XCTest

class AddToCartEventTest: XCTestCase {
  let ITEM = AddToCartEventItem(id: "test-id", quantity: 100)
  let DATE = Date()

  var uut: AddToCartEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = AddToCartEvent(item: ITEM, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "add to cart",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
      ]
    )
  }
}
