@testable import AwareSDK
import XCTest

class CartEventTest: XCTestCase {
  let DATE = Date()

  var uut: CartEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = CartEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(result, ["type": "cart", "timestamp": DATE.timestamp, "device": DEVICE])
  }
}
