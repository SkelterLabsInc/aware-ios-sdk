@testable import AwareSDK
import Foundation

extension ClientSendEventParams: Equatable {
  public static func == (lhs: ClientSendEventParams, rhs: ClientSendEventParams) -> Bool {
    lhs.iid == rhs.iid && lhs.projectId == rhs.projectId && lhs.field == rhs.field
  }
}
