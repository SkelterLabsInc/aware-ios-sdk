import Foundation

public struct LikeEventItem {
  let id: String
  let title: String?
  let price: Int?
  let categoryName: String?
  let brandName: String?
  let imageUrl: String?
  let customFields: CustomFields?

  public init(
    id: String,
    title: String? = nil,
    price: Int? = nil,
    categoryName: String? = nil,
    brandName: String? = nil,
    imageUrl: String? = nil,
    customFields: CustomFields? = nil
  ) {
    self.id = id
    self.title = title
    self.price = price
    self.categoryName = categoryName
    self.brandName = brandName
    self.imageUrl = imageUrl
    self.customFields = customFields
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = [
      "id": id,
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
    if let customFields = customFields {
      field.merge(customFields.toItemField()) { current, _ in current }
    }
    return field
  }
}
