import Foundation

public class HomeEvent: Event {
  init(date: Date) {
    super.init(type: .home, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
