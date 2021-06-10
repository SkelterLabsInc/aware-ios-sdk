@testable import AwareSDK
import XCTest

class PurchaseEventItemTest: XCTestCase {
  let ID = "test-id"
  let QUANTITY = 1
  let PAYMENT = 10000

  var uut: PurchaseEventItem!

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = PurchaseEventItem(
      id: ID,
      quantity: QUANTITY,
      payment: PAYMENT
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "quantity": QUANTITY,
      "payment": PAYMENT,
    ])
  }
}
