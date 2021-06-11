@testable import AwareSDK
import XCTest

class PromotionEventTest: XCTestCase {
  let TEXT = "test-text"
  let DATE = Date()

  var uut: PromotionEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = PromotionEvent(text: TEXT, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      ["type": "promotion", "timestamp": DATE.timestamp, "device": DEVICE, "text": TEXT]
    )
  }
}
