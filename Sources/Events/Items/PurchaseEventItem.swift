import Foundation

public struct PurchaseEventItem {
  let id: String
  let quantity: Int
  let payment: Int

  public init(id: String, quantity: Int, payment: Int) {
    self.id = id
    self.quantity = quantity
    self.payment = payment
  }

  func toItemField() -> [String: AnyHashable] {
    [
      "id": id,
      "quantity": quantity,
      "payment": payment,
    ]
  }
}
