@testable import AwareSDK
import XCTest

class HomeEventTest: XCTestCase {
  let DATE = Date()

  var uut: HomeEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = HomeEvent(date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(result, ["type": "home", "timestamp": DATE.timestamp])
  }
}
