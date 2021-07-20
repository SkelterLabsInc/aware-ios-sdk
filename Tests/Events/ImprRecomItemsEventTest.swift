@testable import AwareSDK
import XCTest

class ImprRecomItemsEventTest: XCTestCase {
  let ITEM1 = RecomItemEventItem(id: "test-id-1")
  let ITEM2 = RecomItemEventItem(id: "test-id-2", title: "test-title")
  let RECOMMENDER_ID = "test-recommender-id"
  let RECOMMENDATION_ID = "test-recommendation-id"
  let DATE = Date()
  let TEST_UUID = UUID()

  var uut: ImprRecomItemsEvent!

  func test_whenUutIsNotInitializedWithRecommendationId_thenToCustomMethodReturnsCustomField() {
    uut = ImprRecomItemsEvent(
      items: [ITEM1, ITEM2],
      recommenderId: RECOMMENDER_ID,
      recommendationId: nil,
      date: DATE,
      uuid: TEST_UUID
    )

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "impr recom items",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "items": [
          ITEM1.toItemField(),
          ITEM2.toItemField(),
        ],
        "recommender_id": RECOMMENDER_ID,
        "recommendation_id": TEST_UUID.uuidString,
      ]
    )
  }

  func test_whenToCustomFieldMethodIsCalled_thenReturnCustomField() {
    uut = ImprRecomItemsEvent(
      items: [ITEM1, ITEM2],
      recommenderId: RECOMMENDER_ID,
      recommendationId: RECOMMENDATION_ID,
      date: DATE,
      uuid: TEST_UUID
    )

    let result = uut.toCustomField()

    XCTAssertEqual(
      result,
      [
        "type": "impr recom items",
        "timestamp": DATE.timestamp,
        "device": DEVICE,
        "items": [
          ITEM1.toItemField(),
          ITEM2.toItemField(),
        ],
        "recommender_id": RECOMMENDER_ID,
        "recommendation_id": RECOMMENDATION_ID,
      ]
    )
  }
}
