import Foundation

public class ItemEvent: Event {
  let item: ItemEventItem

  init(item: ItemEventItem, date: Date) {
    self.item = item
    super.init(type: .item, date: date)
  }

  public convenience init(item: ItemEventItem) {
    self.init(item: item, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["item": item.toItemField()]
  }
}
