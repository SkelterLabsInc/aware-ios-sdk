@testable import AwareSDK
import XCTest

class PurchaseStartEventTest: XCTestCase {
  let DATE = Date()

  var uut: PurchaseStartEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = PurchaseStartEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      ["type": "purchase start", "timestamp": DATE.timestamp, "device": DEVICE]
    )
  }
}
