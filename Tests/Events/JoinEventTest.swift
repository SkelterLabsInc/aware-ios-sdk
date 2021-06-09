@testable import AwareSDK
import XCTest

class JoinEventTest: XCTestCase {
  let DATE = Date()

  var uut: JoinEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = JoinEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(result, ["type": "join", "timestamp": DATE.timestamp])
  }
}
