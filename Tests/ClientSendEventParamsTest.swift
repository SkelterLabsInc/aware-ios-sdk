@testable import AwareSDK
import XCTest

class ClientSendEventParamsTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IID = "test-iid"
  let USER_ID = "test-user-id"
  let TIMESTAMP = Date().timestamp
  let TYPE = "test-type"
  let CURRENT_DATE = Date()

  lazy var FIELD: [String: AnyHashable] = [
    "timestamp": TIMESTAMP,
    "type": TYPE,
  ]

  var uut: ClientSendEventParams!

  func test_whenUutIsInitializedWithNilUserIdAndToBodyMethodIsCalled_thenReturnBody() {
    uut = ClientSendEventParams(
      projectId: PROJECT_ID,
      iid: IID,
      userId: nil,
      field: FIELD,
      date: CURRENT_DATE
    )

    let result = uut.toBody()

    let expectedField: [String: AnyHashable] = [
      "timestamp": TIMESTAMP,
      "type": TYPE,
    ]
    let expectedCustomSignal: [String: AnyHashable] = [
      "iid": IID,
      "pid": PROJECT_ID,
      "timestamp": CURRENT_DATE.timestamp,
      "namespace": "aware",
      "name": "event_log",
      "time_zone": "Asia/Seoul",
      "user_id": "",
      "field_type": "OBJECT",
      "fields": [[
        "object_value": expectedField,
      ]],
      "device": [
        "platform": "mobile",
        "os": "iOS",
        "manufacturer": "Apple",
      ],
    ]
    let expectedResult: [String: AnyHashable] = [
      "signals": [[
        "custom": expectedCustomSignal,
      ]],
    ]
    XCTAssertEqual(result, expectedResult)
  }

  func test_whenUutIsInitializedWithUserIdAndToBodyMethodIsCalled_thenReturnBody() {
    uut = ClientSendEventParams(
      projectId: PROJECT_ID,
      iid: IID,
      userId: USER_ID,
      field: FIELD,
      date: CURRENT_DATE
    )

    let result = uut.toBody()

    let expectedField: [String: AnyHashable] = [
      "timestamp": TIMESTAMP,
      "type": TYPE,
    ]
    let expectedCustomSignal: [String: AnyHashable] = [
      "iid": IID,
      "pid": PROJECT_ID,
      "user_id": USER_ID,
      "timestamp": CURRENT_DATE.timestamp,
      "namespace": "aware",
      "name": "event_log",
      "time_zone": "Asia/Seoul",
      "field_type": "OBJECT",
      "fields": [[
        "object_value": expectedField,
      ]],
      "device": [
        "platform": "mobile",
        "os": "iOS",
        "manufacturer": "Apple",
      ],
    ]
    let expectedResult: [String: AnyHashable] = [
      "signals": [[
        "custom": expectedCustomSignal,
      ]],
    ]
    XCTAssertEqual(result, expectedResult)
  }
}
