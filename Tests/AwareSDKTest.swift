@testable import AwareSDK
import Cuckoo
import Foundation
import XCTest

class AwareSDKTest: XCTestCase {
  let PROJECT_ID = "test-project-id"
  let IDENTIFIER = UUID()

  var device: MockDevice!
  var uut: AwareSDK!

  override func setUp() {
    super.setUp()
    device = MockDevice()
    uut = AwareSDK(currentDevice: device)
  }

  func test_whenIdentifierForVendorReturnsUuid_thenSetProjectIdWithGivenProjectIdAndIidWithTheUuid() {
    stub(device) { stub in
      when(stub.identifierForVendor.get).thenReturn(IDENTIFIER)
    }

    uut.configure(projectId: PROJECT_ID)

    XCTAssertEqual(uut.projectId, PROJECT_ID)
    XCTAssertEqual(uut.iid, IDENTIFIER.uuidString)
  }
}
