import Foundation

public class LikeEvent: Event {
  let item: LikeEventItem

  init(item: LikeEventItem, date: Date) {
    self.item = item
    super.init(type: .like, date: date)
  }

  public convenience init(item: LikeEventItem) {
    self.init(item: item, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["item": item.toItemField()]
  }
}
