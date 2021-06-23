@testable import AwareSDK
import XCTest

class OpenNotificationEventTest: XCTestCase {
  let ITEM = NotificationEventItem(id: "test-id")
  let TEXT = "test-text"
  let DATE = Date()

  var uut: OpenNotificationEvent!

  func test_whenToCustomFieldMethodIsCalledWithNilFields_thenReturnCustomField() {
    uut = OpenNotificationEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "open notification",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": nil,
      ]
    )
  }

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = OpenNotificationEvent(item: ITEM, text: TEXT, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "open notification",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "text": TEXT,
      ]
    )
  }
}
