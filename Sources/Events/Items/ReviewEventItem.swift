import Foundation

public struct ReviewEventItem {
  let id: String

  public init(id: String) {
    self.id = id
  }

  func toItemField() -> [String: AnyHashable] {
    ["id": id]
  }
}
