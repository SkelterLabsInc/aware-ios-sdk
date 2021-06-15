@testable import AwareSDK
import XCTest

class ClickRecomItemEventTest: XCTestCase {
  let ITEM = RecomItemEventItem(
    id: "test-id",
    title: "test-title",
    price: 10000,
    categoryName: "test-category-name",
    brandName: "test-brand-name",
    imageUrl: "test-image-url"
  )
  let POSITION = 100
  let RECOMMENDER_ID = "test-recommender-id"
  let RECOMMENDATION_ID = "test-recommendation-id"
  let DATE = Date()
  let TEST_UUID = UUID()

  var uut: ClickRecomItemEvent!

  func test_whenUutIsNotInitializedWithRecommendationId_thenToCustomMethodReturnsCustomField() {
    uut = ClickRecomItemEvent(
      item: ITEM,
      recommenderId: RECOMMENDER_ID,
      recommendationId: nil,
      position: POSITION,
      date: DATE,
      uuid: TEST_UUID
    )

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "click recom item",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "recommender_id": RECOMMENDER_ID,
        "recommendation_id": TEST_UUID.uuidString,
        "position": POSITION,
      ]
    )
  }

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = ClickRecomItemEvent(
      item: ITEM,
      recommenderId: RECOMMENDER_ID,
      recommendationId: RECOMMENDATION_ID,
      position: POSITION,
      date: DATE,
      uuid: TEST_UUID
    )

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "click recom item",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "item": ITEM.toItemField(),
        "recommender_id": RECOMMENDER_ID,
        "recommendation_id": RECOMMENDATION_ID,
        "position": POSITION,
      ]
    )
  }
}
