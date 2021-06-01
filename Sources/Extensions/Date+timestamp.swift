import Foundation

extension Date {
  var timestamp: Int64 {
    Int64(timeIntervalSince1970 * 1000)
  }
}
