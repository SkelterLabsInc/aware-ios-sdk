@testable import AwareSDK
import XCTest

class LikeEventTest: XCTestCase {
  let ITEM = LikeEventItem(id: "test-id")
  let DATE = Date()

  var uut: LikeEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = LikeEvent(item: ITEM, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "like",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
      ]
    )
  }
}
