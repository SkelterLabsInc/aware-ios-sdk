import Foundation

public class PromotionEvent: Event {
  let text: String

  init(text: String, date: Date) {
    self.text = text
    super.init(type: .promotion, date: date)
  }

  public convenience init(text: String) {
    self.init(text: text, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    ["text": text]
  }
}
