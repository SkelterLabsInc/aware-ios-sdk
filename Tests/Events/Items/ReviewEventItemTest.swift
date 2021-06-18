@testable import AwareSDK
import XCTest

class ReviewEventItemTest: XCTestCase {
  let ID = "test-id"

  var uut: ReviewEventItem!

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = ReviewEventItem(id: ID)

    let result = uut.toItemField()

    XCTAssertEqual(result, ["id": ID])
  }
}
