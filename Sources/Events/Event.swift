import Foundation

typealias CustomField = [String: AnyHashable]

public class Event {
  let type: EventType
  let timestamp: Int64

  init(type: EventType, date: Date = Date()) {
    self.type = type
    timestamp = date.timestamp
  }

  final func toCustomField(idfa: String? = nil) -> CustomField {
    var device: CustomField = [
      "platform": "mobile",
      "os": "iOS",
      "manufacturer": "Apple",
    ]
    if let idfa = idfa {
      device["idfa"] = idfa
    }
    let defaultCustomField: CustomField = [
      "type": type.rawValue,
      "timestamp": timestamp,
      "device": device,
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
