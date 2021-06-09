@testable import AwareSDK
import XCTest

class ClientErrorTest: XCTestCase {
  let ERROR_MESSAGE = "test-error-message"

  var uut: ClientError!

  func test_whenErrorIsBadRequestAndMessageIsNotGiven_thenMessageReturnsPrettyMessage() {
    uut = .badRequest(message: nil)

    let result = uut.message

    XCTAssertEqual(result, "bad request error")
  }

  func test_whenErrorIsBadRequestAndMessageIsGiven_thenMessageReturnsPrettyMessage() {
    uut = .badRequest(message: ERROR_MESSAGE)

    let result = uut.message

    XCTAssertEqual(result, "bad request error: test-error-message")
  }

  func test_whenErrorIsUnauthorizedAndMessageIsNotGiven_thenMessageReturnsPrettyMessage() {
    uut = .unauthorized(message: nil)

    let result = uut.message

    XCTAssertEqual(result, "unauthorized error")
  }

  func test_whenErrorIsUnauthorizedAndMessageIsGiven_thenMessageReturnsPrettyMessage() {
    uut = .unauthorized(message: ERROR_MESSAGE)

    let result = uut.message

    XCTAssertEqual(result, "unauthorized error: test-error-message")
  }

  func test_whenErrorIsInternalServerErrorAndMessageIsNotGiven_thenMessageReturnsPrettyMessage() {
    uut = .internalServerError(message: nil)

    let result = uut.message

    XCTAssertEqual(result, "internal server error")
  }

  func test_whenErrorIsInternalServerErrorAndMessageIsGiven_thenMessageReturnsPrettyMessage() {
    uut = .internalServerError(message: ERROR_MESSAGE)

    let result = uut.message

    XCTAssertEqual(result, "internal server error: test-error-message")
  }

  func test_whenErrorIsUnknownErrorAndMessageIsNotGiven_thenMessageReturnsPrettyMessage() {
    uut = .unknown(message: nil)

    let result = uut.message

    XCTAssertEqual(result, "unknown error")
  }

  func test_whenErrorIsUnknownErrorAndMessageIsGiven_thenMessageReturnsPrettyMessage() {
    uut = .unknown(message: ERROR_MESSAGE)

    let result = uut.message

    XCTAssertEqual(result, "unknown error: test-error-message")
  }
}
