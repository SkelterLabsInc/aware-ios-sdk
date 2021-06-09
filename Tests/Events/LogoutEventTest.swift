@testable import AwareSDK
import XCTest

class LogoutEventTest: XCTestCase {
  let DATE = Date()

  var uut: LogoutEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = LogoutEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(result, ["type": "logout", "timestamp": DATE.timestamp])
  }
}
