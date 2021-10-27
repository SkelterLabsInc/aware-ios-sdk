@testable import AwareSDK
import XCTest

class PurchaseEventTest: XCTestCase {
  let ITEM1 = PurchaseEventItem(id: "test-id-1", quantity: 1, payment: 100)
  let ITEM2 = PurchaseEventItem(id: "test-id-2", quantity: 2, payment: 1000)
  let PRICE = 1100
  let DATE = Date()

  var uut: PurchaseEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = PurchaseEvent(items: [ITEM1, ITEM2], price: 1100, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "purchase",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "items": [
          ITEM1.toItemField(),
          ITEM2.toItemField(),
        ],
        "price": PRICE,
      ]
    )
  }
}
