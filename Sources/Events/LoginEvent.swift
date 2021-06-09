import Foundation

public class LoginEvent: Event {
  init(date: Date) {
    super.init(type: .login, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
