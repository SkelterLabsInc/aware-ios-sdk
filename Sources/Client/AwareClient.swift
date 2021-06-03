import Alamofire
import Foundation

class AwareClient {
  static let BASE_URL = "https://aiq.skelterlabs.com/aware/sdk/v2"

  let session: Alamofire.Session

  init(session: Alamofire.Session = .default) {
    self.session = session
  }

  func sendEvent(
    params: ClientSendEventParams,
    completion: @escaping (Result<Void, AwareError>) -> Void
  ) {
    let parameters = params.toBody()
    let responseSerializer = DataResponseSerializer(emptyResponseCodes: [200, 201, 204, 206])
    session
      .request(
        "\(AwareClient.BASE_URL)/signals?pid=\(params.projectId)",
        method: .post,
        parameters: parameters,
        encoding: JSONEncoding.default,
        headers: ["Content-Type": "application/json"]
      )
      .validate()
      .response(responseSerializer: responseSerializer) { [weak self] response in
        switch response.result {
          case .success:
            completion(.success(()))
          case let .failure(error):
            let errorMessage = self?.getErrorMessage(from: response.data)
            guard let code = error.responseCode else {
              completion(.failure(.unknown(message: errorMessage)))
              return
            }

            switch code {
              case 400:
                completion(.failure(.badRequest(message: errorMessage)))
              case 401:
                completion(.failure(.unauthorized(message: errorMessage)))
              case 500:
                completion(.failure(.internalServerError(message: errorMessage)))
              default:
                completion(.failure(.unknown(message: errorMessage)))
            }
        }
      }
  }

  private func getErrorMessage(from data: Data?) -> String? {
    guard let data = data else { return nil }
    return String(bytes: data, encoding: .utf8)
  }
}
