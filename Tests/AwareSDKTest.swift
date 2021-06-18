@testable import AwareSDK
import Cuckoo
import Foundation
import XCTest

class AwareSDKTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IDENTIFIER = UUID()
  let USER_ID = "test-user-id"
  let DATE = Date()
  lazy var EVENT = JoinEvent(date: DATE)
  lazy var PARAMS = ClientSendEventParams(
    projectId: PROJECT_ID,
    iid: IDENTIFIER.uuidString,
    userId: USER_ID,
    field: EVENT.toCustomField()
  )

  var client: ClientMock!
  var device: MockDevice!
  var uut: AwareSDK!

  func expectSendEventNotCalled() {
    XCTAssertEqual(client.callCount, 0)
  }

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

  func test_whenUnsettingUserId_thenSDKUserIdIsUnset() {
    uut.setUserId(userId: USER_ID)

    uut.unsetUser()

    XCTAssertEqual(uut.userId, nil)
  }

  func test_whenSettingDebugTrue_thenSDKDebugIsSetByTrue() {
    uut.setDebug(debug: true)

    XCTAssertEqual(uut.debug, true)
  }

  func test_whenSettingDebugFalse_thenSDKDebugIsSetByFalse() {
    uut.setDebug(debug: false)

    XCTAssertEqual(uut.debug, false)
  }

  func test_whenTrackJoinEventWithoutUserId_thenDoNotSendEvent() {
    uut.configure(projectId: PROJECT_ID)

    let event = JoinEvent()
    uut.track(event: event)

    expectSendEventNotCalled()
  }

  func test_whenTrackLoginEventWithoutUserId_thenDoNotSendEvent() {
    uut.configure(projectId: PROJECT_ID)

    let event = LoginEvent()
    uut.track(event: event)

    expectSendEventNotCalled()
  }

  func test_whenTrackLogoutEventWithoutUserId_thenDoNotSendEvent() {
    uut.configure(projectId: PROJECT_ID)

    let event = LogoutEvent()
    uut.track(event: event)

    expectSendEventNotCalled()
  }

  func test_whenTrackLikeEventWithoutUserId_thenDoNotSendEvent() {
    uut.configure(projectId: PROJECT_ID)

    let item = LikeEventItem(id: "test-item-id")
    let event = LikeEvent(item: item)
    uut.track(event: event)

    expectSendEventNotCalled()
  }

  func test_whenGivenClientResolvesSuccess_thenSendEventSucceed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    uut.setUserId(userId: USER_ID)
    client.sendEventCalled(with: PARAMS, result: .success(())) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenGivenClientResolvesBadRequest_thenSendEventFailed() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    uut.setUserId(userId: USER_ID)
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
    uut.setUserId(userId: USER_ID)
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
    uut.setUserId(userId: USER_ID)
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
    uut.setUserId(userId: USER_ID)
    client.sendEventCalled(with: PARAMS, result: .failure(.unknown(message: "UNKNOWN MESSAGE"))) {
      expectation.fulfill()
    }

    uut.track(event: EVENT)

    wait(for: [expectation], timeout: 10.0)
  }

  func test_whenLogoutMethodIsCalled_thenSendEventAndUnsetUserIsCalled() {
    let expectation = XCTestExpectation()
    uut.configure(projectId: PROJECT_ID)
    uut.setUserId(userId: USER_ID)
    let params = ClientSendEventParams(
      projectId: PROJECT_ID,
      iid: IDENTIFIER.uuidString,
      userId: USER_ID,
      field: LogoutEvent().toCustomField()
    )
    client.sendEventCalled(
      with: params,
      result: .success(())
    ) {
      expectation.fulfill()
    }
    uut.logout()

    wait(for: [expectation], timeout: 10.0)
    XCTAssertEqual(client.callCount, 1)
    XCTAssertEqual(uut.userId, nil)
  }
}
