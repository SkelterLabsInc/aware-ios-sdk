import Foundation

public struct NotificationEventItem {
  let id: String
  let customFields: CustomFields?

  public init(id: String, customFields: CustomFields? = nil) {
    self.id = id
    self.customFields = customFields
  }

  func toItemField() -> [String: AnyHashable] {
    var field: [String: AnyHashable] = ["id": id]
    if let customFields = customFields {
      field.merge(customFields.toItemField()) { current, _ in current }
    }
    return field
  }
}
