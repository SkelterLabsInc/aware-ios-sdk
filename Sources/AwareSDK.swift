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
  var idfa: String?
  var debug: Bool = false

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

  func unsetUser() {
    serialQueue.sync { [weak self] in
      self?.userId = nil
    }
  }

  func setIdfa(idfa: String) {
    serialQueue.sync { [weak self] in
      self?.idfa = idfa
    }
  }

  func unsetIdfa() {
    serialQueue.sync { [weak self] in
      self?.idfa = nil
    }
  }

  func setDebug(debug: Bool) {
    serialQueue.sync { [weak self] in
      self?.debug = debug
    }
  }

  func track(event: Event) {
    serialQueue.async { [weak self] in
      guard let self = self else { return }
      guard let projectId = self.projectId, let iid = self.iid else {
        if self.debug {
          self.logMessage(
            message: "track %@ event failed. configuring SDK is needed.",
            event.type.rawValue
          )
        }
        return
      }

      let params = ClientSendEventParams(
        projectId: projectId,
        iid: iid,
        userId: self.userId,
        field: event.toCustomField()
      )
      self.client.sendEvent(params: params) { [weak self] result in
        guard let self = self else { return }
        if self.debug {
          self.logTrackResult(event: event, result: result)
        }
      }
    }
  }

  func logout() {
    track(event: LogoutEvent())
    unsetUser()
  }

  // TODO(gaonkim): Consider introducing logger.
  private func logMessage(message: StaticString, _ args: CVarArg...) {
    os_log(message, log: .aware, type: .debug, args)
  }

  private func logTrackResult(event: Event, result: Result<Void, ClientError>) {
    switch result {
      case .success:
        logMessage(message: "track %@ event success", event.type.rawValue)
      case let .failure(error):
        logMessage(
          message: "track %@ event failed with %@",
          event.type.rawValue,
          error.message
        )
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

  static func unsetUser() {
    sharedInstance.unsetUser()
  }

  static func setIdfa(idfa: String) {
    sharedInstance.setIdfa(idfa: idfa)
  }

  static func unsetIdfa() {
    sharedInstance.unsetIdfa()
  }

  static func setDebug(debug: Bool) {
    sharedInstance.setDebug(debug: debug)
  }

  static func track(event: Event) {
    sharedInstance.track(event: event)
  }

  static func logout() {
    sharedInstance.logout()
  }
}
