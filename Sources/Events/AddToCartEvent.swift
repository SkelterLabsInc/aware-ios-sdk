import Foundation

public class AddToCartEvent: Event {
  let item: CartEventItem

  init(item: CartEventItem, date: Date) {
    self.item = item
    super.init(type: .addToCart, date: date)
  }

  public convenience init(item: CartEventItem) {
    self.init(item: item, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["item": item.toItemField()]
  }
}
