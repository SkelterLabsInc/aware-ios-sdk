@testable import AwareSDK
import XCTest

class NotificationReceivedEventTest: XCTestCase {
  let ITEM = NotificationEventItem(id: "test-id")
  let TEXT = "test-text"
  let DATE = Date()

  var uut: NotificationReceivedEvent!

  func test_whenToCustomFieldMethodIsCalledWithNilFields_thenReturnCustomField() {
    uut = NotificationReceivedEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "notification received",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": nil,
      ]
    )
  }

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = NotificationReceivedEvent(item: ITEM, text: TEXT, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "notification received",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "text": TEXT,
      ]
    )
  }
}
