@testable import AwareSDK
import XCTest

class ReviewEventTest: XCTestCase {
  let ITEM = ReviewEventItem(id: "test-id")
  let TEXT = "test-text"
  let COMMENT = "test-comment"
  let RATING = 4.0
  let DATE = Date()

  var uut: ReviewEvent!

  func test_whenToCustomFieldMethodIsCalledWithNilFields_thenReturnCustomField() {
    uut = ReviewEvent(item: ITEM, comment: COMMENT, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "review",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "comment": COMMENT,
      ]
    )
  }

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = ReviewEvent(item: ITEM, text: TEXT, comment: COMMENT, rating: RATING, date: DATE)

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "review",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "text": TEXT,
        "comment": COMMENT,
        "rating": RATING,
      ]
    )
  }
}
