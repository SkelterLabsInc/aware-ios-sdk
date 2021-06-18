import Foundation

public class PurchaseStartEvent: Event {
  init(date: Date) {
    super.init(type: .purchaseStart, date: date)
  }

  public convenience init() {
    self.init(date: Date())
  }
}
