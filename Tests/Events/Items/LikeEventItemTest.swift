@testable import AwareSDK
import XCTest

class LikeEventItemTest: XCTestCase {
  let ID = "test-id"
  let TITLE = "test-title"
  let PRICE = 10000
  let CATEGORY_NAME = "test-category-name"
  let BRAND_NAME = "test-brand-name"
  let IMAGE_URL = "test-image-url"
  let CUSTOM_STRING1 = "str1"
  let CUSTOM_INT1 = 1

  var uut: LikeEventItem!

  func test_whenToItemFieldMethodIsCalledWithNilFields_returnItemField() {
    uut = LikeEventItem(id: ID)

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
    ])
  }

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = LikeEventItem(
      id: ID,
      title: TITLE,
      price: PRICE,
      categoryName: CATEGORY_NAME,
      brandName: BRAND_NAME,
      imageUrl: IMAGE_URL
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "title": TITLE,
      "price": PRICE,
      "category_name": CATEGORY_NAME,
      "brand_name": BRAND_NAME,
      "image_url": IMAGE_URL,
    ])
  }

  func test_whenToItemFieldMethodWithIsCalledWithCustomFields_returnItemField() {
    uut = LikeEventItem(
      id: ID,
      title: TITLE,
      price: PRICE,
      categoryName: CATEGORY_NAME,
      brandName: BRAND_NAME,
      imageUrl: IMAGE_URL,
      customFields: CustomFields(string1: CUSTOM_STRING1, int1: CUSTOM_INT1)
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "title": TITLE,
      "price": PRICE,
      "category_name": CATEGORY_NAME,
      "brand_name": BRAND_NAME,
      "image_url": IMAGE_URL,
      "custom_str_1": CUSTOM_STRING1,
      "custom_int_1": CUSTOM_INT1,
    ])
  }
}
