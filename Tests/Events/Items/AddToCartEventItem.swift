@testable import AwareSDK
import XCTest

class AddToCartEventItemTest: XCTestCase {
  let ID = "test-id"
  let TITLE = "test-title"
  let PRICE = 10000
  let QUANTITY = 1
  let CATEGORY_NAME = "test-category-name"
  let BRAND_NAME = "test-brand-name"
  let IMAGE_URL = "test-image-url"

  var uut: AddToCartEventItem!

  func test_whenToItemFieldMethodIsCalledWithNilFields_returnItemField() {
    uut = AddToCartEventItem(id: ID, quantity: QUANTITY)

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "quantity": QUANTITY,
    ])
  }

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = AddToCartEventItem(
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
}
