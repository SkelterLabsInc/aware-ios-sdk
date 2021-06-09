@testable import AwareSDK
import XCTest

class ItemEventItemTest: XCTestCase {
  let ID = "test-id"
  let TITLE = "test-title"
  let ORIGINAL_PRICE = 10000
  let PRICE = 10000
  let CATEGORY_NAME = "test-category-name"
  let BRAND_NAME = "test-brand-name"
  let IMAGE_URL = "test-image-url"
  let OUT_OF_STOCK = false

  var uut: ItemEventItem!

  func test_whenToDictionaryMethodIsCalled_returnDictionary() {
    uut = ItemEventItem(
      id: ID,
      title: TITLE,
      originalPrice: ORIGINAL_PRICE,
      price: PRICE,
      categoryName: CATEGORY_NAME,
      brandName: BRAND_NAME,
      imageUrl: IMAGE_URL,
      outOfStock: OUT_OF_STOCK
    )

    let result = uut.toItemField()

    XCTAssertEqual(result, [
      "id": ID,
      "title": TITLE,
      "original_price": ORIGINAL_PRICE,
      "price": PRICE,
      "category_name": CATEGORY_NAME,
      "brand_name": BRAND_NAME,
      "image_url": IMAGE_URL,
      "out_of_stock": "false",
    ])
  }
}
