import Foundation

public class ReviewEvent: Event {
  let item: ReviewEventItem
  let text: String?
  let comment: String
  let rating: Double?

  init(
    item: ReviewEventItem,
    text: String? = nil,
    comment: String,
    rating: Double? = nil,
    date: Date
  ) {
    self.item = item
    self.text = text
    self.comment = comment
    self.rating = rating
    super.init(type: .review, date: date)
  }

  public convenience init(
    item: ReviewEventItem,
    text: String? = nil,
    comment: String,
    rating: Double? = nil
  ) {
    self.init(item: item, text: text, comment: comment, rating: rating, date: Date())
  }

  override func makeEventSpecificCustomField() -> CustomField {
    var field: [String: AnyHashable] = [
      "item": item.toItemField(),
      "comment": comment,
    ]
    if let text = text {
      field["text"] = text
    }
    if let rating = rating {
      field["rating"] = rating
    }
    return field
  }
}
