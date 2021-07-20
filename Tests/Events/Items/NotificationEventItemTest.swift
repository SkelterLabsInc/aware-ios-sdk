@testable import AwareSDK
import XCTest

class NotificationEventItemTest: XCTestCase {
  let ID = "test-id"

  var uut: NotificationEventItem!

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = NotificationEventItem(id: ID)

    let result = uut.toItemField()

    XCTAssertEqual(result, ["id": ID])
  }
}
