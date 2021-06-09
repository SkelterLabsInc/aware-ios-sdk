import Foundation
import os.log
import UIKit

public class AwareSDK {
  let serialQueue = DispatchQueue(label: "AwareSDK:SerialQueue")
  let client: Client
  let currentDevice: Device

  var projectId: String?
  var iid: String?
  var userId: String?

  init(client: Client = AwareClient(), currentDevice: Device = UIDevice.current) {
    self.client = client
    self.currentDevice = currentDevice
  }

  func configure(projectId: String) {
    serialQueue.sync { [weak self] in
      self?.projectId = projectId
      self?.iid = currentDevice.identifierForVendor?.uuidString
    }
  }

  func setUserId(userId: String) {
    serialQueue.sync { [weak self] in
      self?.userId = userId
    }
  }

  func track(event: Event) {
    serialQueue.async { [weak self] in
      guard let self = self, let projectId = self.projectId, let iid = self.iid else {
        os_log(
          "track `%@` event failed. configuring SDK is needed.",
          log: .aware,
          type: .debug,
          event.type.rawValue
        )
        return
      }

      let params = ClientSendEventParams(
        projectId: projectId,
        iid: iid,
        userId: self.userId,
        field: event.toCustomField()
      )
      self.client.sendEvent(params: params) { result in
        // TODO(gaonkim): Only log when debug mode is on.
        switch result {
          case .success:
            os_log(
              "track `%@` event success",
              log: .aware,
              type: .debug,
              event.type.rawValue
            )
          case let .failure(error):
            os_log(
              "track `%@` event failed with %@",
              log: .aware,
              type: .debug,
              event.type.rawValue,
              error.message
            )
        }
      }
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
