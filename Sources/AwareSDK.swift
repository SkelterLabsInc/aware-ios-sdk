import Foundation
import UIKit

public class AwareSDK {
  let serialQueue = DispatchQueue(label: "AwareSDK:SerialQueue")
  let currentDevice: Device

  var projectId: String?
  var iid: String?
  var userId: String?

  init(currentDevice: Device = UIDevice.current) {
    self.currentDevice = currentDevice
  }

  func configure(projectId: String) {
    serialQueue.sync {
      self.projectId = projectId
      self.iid = currentDevice.identifierForVendor?.uuidString
    }
  }

  func setUserId(userId: String) {
    serialQueue.sync {
      self.userId = userId
    }
  }
}

// MARK: - Singleton support for AwareSDK

public extension AwareSDK {
  internal static let sharedInstance = AwareSDK()

  static func configure(projectId: String) {
    sharedInstance.configure(projectId: projectId)
  }

  static func setUserId(userId: String) {
    sharedInstance.setUserId(userId: userId)
  }
}
