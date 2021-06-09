import Foundation

typealias CustomField = [String: AnyHashable]

public class Event {
  let type: EventType
  let timestamp: Int64

  init(type: EventType, date: Date = Date()) {
    self.type = type
    timestamp = date.timestamp
  }

  func toCustomField() -> CustomField {
    let defaultCustomField: CustomField = [
      "type": type.rawValue,
      "timestamp": timestamp,
    ]
    let customField = mergeCustomFields(defaultCustomField, makeEventSpecificCustomField())
    return customField
  }

  func makeEventSpecificCustomField() -> CustomField {
    [:]
  }

  private func mergeCustomFields(_ lhs: CustomField, _ rhs: CustomField) -> CustomField {
    var customField = lhs
    customField.merge(rhs) { current, _ in current }
    return customField
  }
}
