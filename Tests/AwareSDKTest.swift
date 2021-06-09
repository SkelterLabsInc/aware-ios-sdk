@testable import AwareSDK
import Cuckoo
import Foundation
import XCTest

class AwareSDKTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IDENTIFIER = UUID()
  let USER_ID = "test-user-id"
  let DATE = Date()
  lazy var PARAMS = ClientSendEventParams(
    projectId: PROJECT_ID,
    iid: IDENTIFIER.uuidString,
    userId: USER_ID,
    field: ["type": "home", "timestamp": DATE.timestamp]
  )
  lazy var EVENT = HomeEvent(date: DATE)

  var client: ClientMock!

  var device: MockDevice!
  var uut: AwareSDK!

  override func setUp() {
    super.setUp()
    client = ClientMock()
    device = MockDevice()
    uut = AwareSDK(client: client, currentDevice: device)
    stub(device) { stub in
      when(stub.identifierForVendor.get).thenReturn(IDENTIFIER)
    }
  }

  func test_whenIdentifierForVendorReturnsUuid_thenSetProjectIdWithGivenProjectIdAndIidWithTheUuid(
  ) {
    uut.configure(projectId: PROJECT_ID)

    XCTAssertEqual(uut.projectId, PROJECT_ID)
    XCTAssertEqual(uut.iid, IDENTIFIER.uuidString)
  }

  func test_whenSettingUserId_thenSDKUserIdIsSetByTheUserId() {
    uut.setUserId(userId: USER_ID)

    XCTAssertEqual(uut.userId, USER_ID)
  }

  func test_whenGivenClientResolvesSuccess_thenSendEventSucceed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    client.sendEventCalled(with: PARAMS, result: .success(())) {
      expectation.fulfill()
    }

    let event = HomeEvent(date: DATE)
    uut.track(event: event)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenGivenClientResolvesBadRequest_thenSendEventFailed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    client.sendEventCalled(
      with: PARAMS,
      result: .failure(.badRequest(message: "BAD REQUEST MESSAGE"))
    ) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenGivenClientResolvesUnauthorized_thenSendEventFailed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    client.sendEventCalled(
      with: PARAMS,
      result: .failure(.unauthorized(message: "UNAUTHORIZED MESSAGE"))
    ) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenGivenClientResolvesInternalServerError_thenSendEventFailed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    client.sendEventCalled(
      with: PARAMS,
      result: .failure(.internalServerError(message: "INTERNAL SERVER ERROR MESSAGE"))
    ) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenGivenClientResolvesUnknown_thenSendEventFailed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    client.sendEventCalled(with: PARAMS, result: .failure(.unknown(message: "UNKNOWN MESSAGE"))) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }
}
