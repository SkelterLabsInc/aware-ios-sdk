@testable import AwareSDK
import XCTest

class LoginEventTest: XCTestCase {
  let DATE = Date()

  var uut: LoginEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = LoginEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(result, ["type": "login", "timestamp": DATE.timestamp, "device": DEVICE])
  }
}
