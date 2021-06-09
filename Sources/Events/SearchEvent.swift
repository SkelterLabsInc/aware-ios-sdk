import Foundation

public class SearchEvent: Event {
  let query: String

  init(query: String, date: Date) {
    self.query = query
    super.init(type: .search, date: date)
  }

  public convenience init(query: String) {
    self.init(query: query, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["query": query]
  }
}
