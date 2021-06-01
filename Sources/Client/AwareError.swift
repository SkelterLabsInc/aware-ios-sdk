import Foundation

typealias AwareErrorMessage = String?

enum AwareError: Error {
  case badRequest(message: AwareErrorMessage)
  case unauthorized(message: AwareErrorMessage)
  case internalServerError(message: AwareErrorMessage)
  case unknown(message: AwareErrorMessage)
}
