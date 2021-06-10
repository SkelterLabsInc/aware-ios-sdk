import Foundation

public class AddToCartEvent: Event {
  let item: AddToCartEventItem

  init(item: AddToCartEventItem, date: Date) {
    self.item = item
    super.init(type: .addToCart, date: date)
  }

  public convenience init(item: AddToCartEventItem) {
    self.init(item: item, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["item": item.toItemField()]
  }
}
