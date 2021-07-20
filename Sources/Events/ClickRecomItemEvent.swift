import Foundation

public class ClickRecomItemEvent: Event {
  let item: RecomItemEventItem
  let recommenderId: String
  let recommendationId: String
  let position: Int

  init(
    item: RecomItemEventItem,
    recommenderId: String,
    recommendationId: String?,
    position: Int,
    date: Date,
    uuid: UUID
  ) {
    self.item = item
    self.recommenderId = recommenderId
    self.recommendationId = recommendationId ?? uuid.uuidString
    self.position = position
    super.init(type: .clickRecomItem, date: date)
  }

  public convenience init(
    item: RecomItemEventItem,
    recommenderId: String,
    recommendationId: String? = nil,
    position: Int
  ) {
    self.init(
      item: item,
      recommenderId: recommenderId,
      recommendationId: recommendationId,
      position: position,
      date: Date(),
      uuid: UUID()
    )
  }

  override func makeEventSpecificCustomField() -> CustomField {
    [
      "item": item.toItemField(),
      "recommender_id": recommenderId,
      "recommendation_id": recommendationId,
      "position": position,
    ]
  }
}
