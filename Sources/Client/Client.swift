import Foundation

protocol Client {
  func sendEvent(
    params: ClientSendEventParams,
    completion: @escaping (Result<Void, ClientError>) -> Void
  )
}
