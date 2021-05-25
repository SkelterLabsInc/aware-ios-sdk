import UIKit

// NOTE: Use protocol to mock UIDevice.
protocol Device {
  var identifierForVendor: UUID? { get }
}

extension UIDevice: Device {}
