import Foundation

public class LogoutEvent: Event {
  init(date: Date) {
    super.init(type: .logout, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
