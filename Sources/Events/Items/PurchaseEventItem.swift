import Foundation

public struct PurchaseEventItem {
  let id: String
  let quantity: Int
  let payment: Int
  let customFields: CustomFields?

  public init(id: String, quantity: Int, payment: Int, customFields: CustomFields? = nil) {
    self.id = id
    self.quantity = quantity
    self.payment = payment
    self.customFields = customFields
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = [
      "id": id,
      "quantity": quantity,
      "payment": payment,
    ]
    if let customFields = customFields {
      field.merge(customFields.toItemField()) { current, _ in current }
    }
    return field
  }
}
