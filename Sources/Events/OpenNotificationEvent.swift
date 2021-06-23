import Foundation

public class OpenNotificationEvent: Event {
  let item: NotificationEventItem?
  let text: String?

  init(
    item: NotificationEventItem? = nil,
    text: String? = nil,
    date: Date
  ) {
    self.item = item
    self.text = text
    super.init(type: .openNotification, date: date)
  }

  public convenience init(
    item: NotificationEventItem? = nil,
    text: String? = nil
  ) {
    self.init(item: item, text: text, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    var field: [String: AnyHashable] = [
      "item": item?.toItemField(),
    ]
    if let text = text {
      field["text"] = text
    }
    return field
  }
}
