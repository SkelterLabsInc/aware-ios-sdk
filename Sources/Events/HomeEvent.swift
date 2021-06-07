import Foundation

public struct HomeEvent: Event {
  let type: EventType
  let timestamp: Int64

  init(date: Date) {
    type = .home
    timestamp = date.timestamp
  }

  public init() {
    self.init(date: Date())
  }

  func makeEventSpecificCustomField() -> CustomField {
    [:]
  }
}
