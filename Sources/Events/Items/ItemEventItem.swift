import Foundation

public struct ItemEventItem {
  let id: String
  let title: String
  let originalPrice: Int
  let price: Int
  let categoryName: String
  let description: String?
  let brandName: String
  let imageUrl: String
  let outOfStock: Bool
  let customFields: CustomFields?

  public init(
    id: String,
    title: String,
    originalPrice: Int,
    price: Int,
    categoryName: String,
    description: String? = nil,
    brandName: String,
    imageUrl: String,
    outOfStock: Bool,
    customFields: CustomFields? = nil
  ) {
    self.id = id
    self.title = title
    self.originalPrice = originalPrice
    self.price = price
    self.categoryName = categoryName
    self.description = description
    self.brandName = brandName
    self.imageUrl = imageUrl
    self.outOfStock = outOfStock
    self.customFields = customFields
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = [
      "id": id,
      "title": title,
      "original_price": originalPrice,
      "price": price,
      "category_name": categoryName,
      "brand_name": brandName,
      "image_url": imageUrl,
      "out_of_stock": String(outOfStock),
    ]
    if let description = description {
      field["description"] = description
    }
    if let customFields = customFields {
      field.merge(customFields.toItemField()) { current, _ in current }
    }
    return field
  }
}
