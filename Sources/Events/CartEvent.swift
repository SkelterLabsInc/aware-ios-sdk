import Foundation

public class CartEvent: Event {
  init(date: Date) {
    super.init(type: .cart, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
