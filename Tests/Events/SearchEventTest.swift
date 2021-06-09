@testable import AwareSDK
import XCTest

class SearchEventTest: XCTestCase {
  let QUERY = "test-query"
  let DATE = Date()

  var uut: SearchEvent!

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = SearchEvent(query: QUERY, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "search",
        "timestamp": DATE.timestamp,
        "query": QUERY,
      ]
    )
  }
}
