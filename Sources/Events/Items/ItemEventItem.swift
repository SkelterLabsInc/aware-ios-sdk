import Foundation

public struct ItemEventItem {
  let id: String
  let title: String
  let originalPrice: Int
  let price: Int
  let categoryName: String
  let brandName: String
  let imageUrl: String
  let outOfStock: Bool

  public init(
    id: String,
    title: String,
    originalPrice: Int,
    price: Int,
    categoryName: String,
    brandName: String,
    imageUrl: String,
    outOfStock: Bool
  ) {
    self.id = id
    self.title = title
    self.originalPrice = originalPrice
    self.price = price
    self.categoryName = categoryName
    self.brandName = brandName
    self.imageUrl = imageUrl
    self.outOfStock = outOfStock
  }

  func toItemField() -> [String: AnyHashable] {
    [
      "id": id,
      "title": title,
      "original_price": originalPrice,
      "price": price,
      "category_name": categoryName,
      "brand_name": brandName,
      "image_url": imageUrl,
      "out_of_stock": String(outOfStock),
    ]
  }
}
