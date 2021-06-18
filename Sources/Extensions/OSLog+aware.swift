import Foundation
import os.log

extension OSLog {
  private static var subsystem = Bundle.main.bundleIdentifier!

  static let aware = OSLog(subsystem: subsystem, category: "AwareSDK")
}
