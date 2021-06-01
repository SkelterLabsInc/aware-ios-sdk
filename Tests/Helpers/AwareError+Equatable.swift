@testable import AwareSDK
import Foundation

extension AwareError: Equatable {
  public static func == (lhs: AwareError, rhs: AwareError) -> Bool {
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
