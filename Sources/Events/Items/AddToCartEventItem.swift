import Foundation

public struct AddToCartEventItem {
  let id: String
  let title: String?
  let price: Int?
  let quantity: Int
  let categoryName: String?
  let brandName: String?
  let imageUrl: String?

  public init(
    id: String,
    title: String? = nil,
    price: Int? = nil,
    quantity: Int,
    categoryName: String? = nil,
    brandName: String? = nil,
    imageUrl: String? = nil
  ) {
    self.id = id
    self.title = title
    self.price = price
    self.quantity = quantity
    self.categoryName = categoryName
    self.brandName = brandName
    self.imageUrl = imageUrl
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = [
      "id": id,
      "quantity": quantity,
    ]
    if let title = title {
      field["title"] = title
    }
    if let price = price {
      field["price"] = price
    }
    if let categoryName = categoryName {
      field["category_name"] = categoryName
    }
    if let brandName = brandName {
      field["brand_name"] = brandName
    }
    if let imageUrl = imageUrl {
      field["image_url"] = imageUrl
    }
    return field
  }
}
