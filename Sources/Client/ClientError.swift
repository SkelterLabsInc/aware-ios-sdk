import Foundation

typealias ClientErrorMessage = String?

enum ClientError: Error {
  case badRequest(message: ClientErrorMessage)
  case unauthorized(message: ClientErrorMessage)
  case internalServerError(message: ClientErrorMessage)
  case unknown(message: ClientErrorMessage)

  var message: String {
    switch self {
      case let .badRequest(message):
        return createErrorMessage(errorString: "bad request error", message: message)
      case let .unauthorized(message):
        return createErrorMessage(errorString: "unauthorized error", message: message)
      case let .internalServerError(message):
        return createErrorMessage(errorString: "internal server error", message: message)
      case let .unknown(message):
        return createErrorMessage(errorString: "unknown error", message: message)
    }
  }

  private func createErrorMessage(errorString: String, message: String?) -> String {
    let errorMessage = message != nil ? ": \(message ?? "")" : ""
    return "\(errorString)\(errorMessage)"
  }
}
