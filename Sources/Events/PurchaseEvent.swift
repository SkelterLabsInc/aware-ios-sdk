import Foundation

public class PurchaseEvent: Event {
  let items: [PurchaseEventItem]
  let price: Int

  init(items: [PurchaseEventItem], price: Int, date: Date) {
    self.items = items
    self.price = price
    super.init(type: .purchase, date: date)
  }

  public convenience init(items: [PurchaseEventItem], price: Int) {
    self.init(items: items, price: price, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["items": items.map { item in item.toItemField() }, "price": price]
  }
}
