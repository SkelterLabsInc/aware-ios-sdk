import Foundation

public class ImprRecomItemsEvent: Event {
  let items: [RecomItemEventItem]
  let recommenderId: String
  let recommendationId: String

  init(
    items: [RecomItemEventItem],
    recommenderId: String,
    recommendationId: String?,
    date: Date,
    uuid: UUID
  ) {
    self.items = items
    self.recommenderId = recommenderId
    self.recommendationId = recommendationId ?? uuid.uuidString
    super.init(type: .imprRecomItems, date: date)
  }

  public convenience init(
    items: [RecomItemEventItem],
    recommenderId: String,
    recommendationId: String? = nil
  ) {
    self.init(
      items: items,
      recommenderId: recommenderId,
      recommendationId: recommendationId,
      date: Date(),
      uuid: UUID()
    )
  }

  override func makeEventSpecificCustomField() -> CustomField {
    [
      "items": items.map { item in item.toItemField() },
      "recommender_id": recommenderId,
      "recommendation_id": recommendationId,
    ]
  }
}
