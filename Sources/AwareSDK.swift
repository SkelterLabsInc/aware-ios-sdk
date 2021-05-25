import Foundation
import UIKit

public class AwareSDK {
  let serialQueue = DispatchQueue(label: "AwareSDK:SerialQueue")
  let currentDevice: Device

  var projectId: String?
  var iid: String?

  init(currentDevice: Device = UIDevice.current) {
    self.currentDevice = currentDevice
  }

  func configure(projectId: String) {
    serialQueue.sync {
      self.projectId = projectId
      self.iid = currentDevice.identifierForVendor?.uuidString
    }
  }
}

// MARK: - Singleton support for AwareSDK

extension AwareSDK {
  static let sharedInstance = AwareSDK()

  public static func configure(projectId: String) {
    sharedInstance.configure(projectId: projectId)
  }
}
