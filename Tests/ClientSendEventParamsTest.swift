@testable import AwareSDK
import XCTest

class ClientSendEventParamsTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IID = "test-iid"
  let TIMESTAMP = Date().timestamp
  let TYPE = "test-type"
  let CURRENT_DATE = Date()

  lazy var FIELD: [String: AnyHashable] = [
    "timestamp": TIMESTAMP,
    "type": TYPE,
  ]

  var uut: ClientSendEventParams!

  override func setUp() {
    uut = ClientSendEventParams(
      projectId: PROJECT_ID,
      iid: IID,
      field: FIELD,
      date: CURRENT_DATE
    )
  }

  func test_whenToBodyMethodCalled_thenReturnBody() {
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
      "field_type": "OBJECT",
      "fields": [[
        "object_value": expectedField,
      ]],
    ]
    let expectedResult: [String: AnyHashable] = [
      "signals": [[
        "custom": expectedCustomSignal,
      ]],
    ]
    XCTAssertEqual(result, expectedResult)
  }
}
