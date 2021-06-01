import Alamofire
@testable import AwareSDK
import Mocker
import XCTest

class AwareClientTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IID = "test-iid"
  let TYPE = "test-type"
  let TIMESTAMP = Date().timestamp
  let ERROR_MESSAGE = "test-error-message"

  lazy var VALID_SEND_EVENT_PARAMS = ClientSendEventParams(
    projectId: PROJECT_ID,
    iid: IID,
    field: [
      "type": TYPE,
      "timestamp": TIMESTAMP,
    ]
  )

  var uut: AwareClient!

  override func setUp() {
    let configuration = URLSessionConfiguration.af.default
    configuration.protocolClasses = [MockingURLProtocol.self]
    uut = AwareClient(session: Session(configuration: configuration))
  }

  func givenApiReturnsError(statusCode: Int) {
    let mock = Mock(
      url: URL(string: "\(AwareClient.BASE_URL)/signals?pid=\(PROJECT_ID)")!,
      dataType: .json,
      statusCode: statusCode,
      data: [.post: Data(ERROR_MESSAGE.utf8)]
    )
    mock.register()
  }

  func givenApiReturnsSuccess() {
    let mock = Mock(
      url: URL(string: "\(AwareClient.BASE_URL)/signals?pid=\(PROJECT_ID)")!,
      dataType: .json,
      statusCode: 200,
      data: [.post: Data("{}".utf8)]
    )
    mock.register()
  }

  func test_whenApiReturns400Error_thenResolvesBadRequestError() {
    let expectation = XCTestExpectation()
    givenApiReturnsError(statusCode: 400)

    uut.sendEvent(params: VALID_SEND_EVENT_PARAMS) { [weak self] result in
      switch result {
        case .success:
          print("test failed.")
        case let .failure(error):
          XCTAssertEqual(error, .badRequest(message: self?.ERROR_MESSAGE))
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenApiReturns401Error_thenResolvesUnauthorizedError() {
    let expectation = XCTestExpectation()
    givenApiReturnsError(statusCode: 401)

    uut.sendEvent(params: VALID_SEND_EVENT_PARAMS) { [weak self] result in
      switch result {
        case .success:
          print("test failed.")
        case let .failure(error):
          XCTAssertEqual(error, .unauthorized(message: self?.ERROR_MESSAGE))
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenApiReturns500Error_thenResolvesInternalServerError() {
    let expectation = XCTestExpectation()
    givenApiReturnsError(statusCode: 500)

    uut.sendEvent(params: VALID_SEND_EVENT_PARAMS) { [weak self] result in
      switch result {
        case .success:
          print("test failed.")
        case let .failure(error):
          XCTAssertEqual(error, .internalServerError(message: self?.ERROR_MESSAGE))
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenApiReturnsUndefinedError_thenResolvesUnknownError() {
    let expectation = XCTestExpectation()
    givenApiReturnsError(statusCode: 501)

    uut.sendEvent(params: VALID_SEND_EVENT_PARAMS) { [weak self] result in
      switch result {
        case .success:
          print("test failed.")
        case let .failure(error):
          XCTAssertEqual(error, .unknown(message: self?.ERROR_MESSAGE))
          expectation.fulfill()
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenApiReturnsSuccess_thenResolvesSuccess() {
    let expectation = XCTestExpectation()
    givenApiReturnsSuccess()

    uut.sendEvent(params: VALID_SEND_EVENT_PARAMS) { result in
      switch result {
        case .success:
          expectation.fulfill()
        case .failure:
          print("test failed.")
      }
    }

    wait(for: [expectation], timeout: 10.0)
  }
}
