import Foundation

public class RemoveFromCartEvent: Event {
  let items: [CartEventItem]

  init(items: [CartEventItem], date: Date) {
    self.items = items
    super.init(type: .removeFromCart, date: date)
  }

  public convenience init(items: [CartEventItem]) {
    self.init(items: items, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["items": items.map { item in item.toItemField() }]
  }
}
