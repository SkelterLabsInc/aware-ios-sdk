import Foundation

typealias CustomField = [String: AnyHashable]

protocol Event {
  var type: EventType { get }
  var timestamp: Int64 { get }

  func toCustomField() -> CustomField

  func makeEventSpecificCustomField() -> CustomField
}

extension Event {
  func toCustomField() -> CustomField {
    let defaultCustomField: CustomField = [
      "type": type.rawValue,
      "timestamp": timestamp,
    ]
    let customField = mergeCustomFields(defaultCustomField, makeEventSpecificCustomField())
    return customField
  }

  private func mergeCustomFields(_ lhs: CustomField, _ rhs: CustomField) -> CustomField {
    var customField = lhs
    customField.merge(rhs) { current, _ in current }
    return customField
  }
}
