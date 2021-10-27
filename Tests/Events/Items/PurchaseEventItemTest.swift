@testable import AwareSDK
import XCTest

class PurchaseEventItemTest: XCTestCase {
  let ID = "test-id"
  let QUANTITY = 1
  let PAYMENT = 10000
  let CUSTOM_STRING1 = "str1"
  let CUSTOM_INT1 = 1

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

  func test_whenToItemFieldMethodIsCalledWithCustomFields_returnItemField() {
    uut = PurchaseEventItem(
      id: ID,
      quantity: QUANTITY,
      payment: PAYMENT,
      customFields: CustomFields(string1: CUSTOM_STRING1, int1: CUSTOM_INT1)
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "quantity": QUANTITY,
      "payment": PAYMENT,
      "custom_str_1": CUSTOM_STRING1,
      "custom_int_1": CUSTOM_INT1,
    ])
  }
}
