@testable import AwareSDK
import XCTest

class RemoveFromCartEventTest: XCTestCase {
  let ITEM1 = CartEventItem(id: "test-id-1", quantity: 100)
  let ITEM2 = CartEventItem(id: "test-id-2", quantity: 1000)
  let DATE = Date()

  var uut: RemoveFromCartEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = RemoveFromCartEvent(items: [ITEM1, ITEM2], date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "remove from cart",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "items": [
          ITEM1.toItemField(),
          ITEM2.toItemField(),
        ],
      ]
    )
  }
}
