@testable import AwareSDK
import XCTest

class RecomItemEventItemTest: XCTestCase {
  let ID = "test-id"
  let TITLE = "test-title"
  let PRICE = 10000
  let CATEGORY_NAME = "test-category-name"
  let BRAND_NAME = "test-brand-name"
  let IMAGE_URL = "test-image-url"

  var uut: RecomItemEventItem!

  func test_whenToItemFieldMethodIsCalledWithNilFields_returnItemField() {
    uut = RecomItemEventItem(id: ID)

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
    ])
  }

  func test_whenToItemFieldMethodIsCalled_returnItemField() {
    uut = RecomItemEventItem(
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
}
