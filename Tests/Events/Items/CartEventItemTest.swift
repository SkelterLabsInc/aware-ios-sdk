@testable import AwareSDK
import XCTest

class CartEventItemTest: XCTestCase {
  let ID = "test-id"
  let TITLE = "test-title"
  let PRICE = 10000
  let QUANTITY = 1
  let CATEGORY_NAME = "test-category-name"
  let BRAND_NAME = "test-brand-name"
  let IMAGE_URL = "test-image-url"
  let CUSTOM_STRING1 = "str1"
  let CUSTOM_INT1 = 1

  var uut: CartEventItem!

  func test_whenToItemFieldMethodIsCalledWithNilFields_returnItemField() {
    uut = CartEventItem(id: ID, quantity: QUANTITY)

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "quantity": QUANTITY,
    ])
  }

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = CartEventItem(
      id: ID,
      title: TITLE,
      price: PRICE,
      quantity: QUANTITY,
      categoryName: CATEGORY_NAME,
      brandName: BRAND_NAME,
      imageUrl: IMAGE_URL
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "title": TITLE,
      "price": PRICE,
      "quantity": QUANTITY,
      "category_name": CATEGORY_NAME,
      "brand_name": BRAND_NAME,
      "image_url": IMAGE_URL,
    ])
  }

  func test_whenToItemFieldMethodIsCalledWithCustomFields_returnItemField() {
    uut = CartEventItem(
      id: ID,
      title: TITLE,
      price: PRICE,
      quantity: QUANTITY,
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
      "quantity": QUANTITY,
      "category_name": CATEGORY_NAME,
      "brand_name": BRAND_NAME,
      "image_url": IMAGE_URL,
      "custom_str_1": CUSTOM_STRING1,
      "custom_int_1": CUSTOM_INT1,
    ])
  }
}
