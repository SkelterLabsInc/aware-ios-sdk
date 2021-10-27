@testable import AwareSDK
import XCTest

class ReviewEventItemTest: XCTestCase {
  let ID = "test-id"
  let CUSTOM_STRING1 = "str1"
  let CUSTOM_INT1 = 1

  var uut: ReviewEventItem!

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = ReviewEventItem(id: ID)

    let result = uut.toItemField()

    XCTAssertEqual(result, ["id": ID])
  }

  func test_whenToItemFieldMethodIsCalledWithCustomFields_returnItemField() {
    uut = ReviewEventItem(
      id: ID,
      customFields: CustomFields(string1: CUSTOM_STRING1, int1: CUSTOM_INT1)
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "custom_str_1": CUSTOM_STRING1,
      "custom_int_1": CUSTOM_INT1,
    ])
  }
}
