@testable import AwareSDK
import Foundation

extension ClientError: Equatable {
  public static func == (lhs: ClientError, rhs: ClientError) -> Bool {
    switch (lhs, rhs) {
      case let (.badRequest(lhsMessage), .badRequest(rhsMessage)):
        return lhsMessage == rhsMessage
      case let (.unauthorized(lhsMessage), .unauthorized(rhsMessage)):
        return lhsMessage == rhsMessage
      case let (.internalServerError(lhsMessage), .internalServerError(rhsMessage)):
        return lhsMessage == rhsMessage
      case let (.unknown(lhsMessage), .unknown(rhsMessage)):
        return lhsMessage == rhsMessage
      default:
        return false
    }
  }
}
