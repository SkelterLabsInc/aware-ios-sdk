import Foundation

public class JoinEvent: Event {
  init(date: Date) {
    super.init(type: .join, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
