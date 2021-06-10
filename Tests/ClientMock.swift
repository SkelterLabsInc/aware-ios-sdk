@testable import AwareSDK
import Foundation

class ClientMock: Client {
  var expectedParams: ClientSendEventParams!
  var result: Result<Void, ClientError>!
  var callback: (() -> Void)!
  var callCount = 0

  func sendEventCalled(
    with params: ClientSendEventParams,
    result: Result<Void, ClientError>,
    callback: @escaping () -> Void
  ) {
    expectedParams = params
    self.result = result
    self.callback = callback
  }

  func sendEvent(
    params: ClientSendEventParams,
    completion: (Result<Void, ClientError>) -> Void
  ) {
    callCount += 1
    if expectedParams == params {
      completion(result)
      callback()
    }
  }
}
