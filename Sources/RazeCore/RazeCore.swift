//import UIKit
//import Foundation
import SwiftUI



/// <#Description#>
/// - Parameters:
///     - Warning: The "#" symbol is stripped from the begining
///     - hexString: expects 6 digit hex string in the format RRGGBB, with or without leading #
///     - alpha: CGFloat for alpha, 0 to 1, default 1
/// - Returns: UIColor determined by `hexString`
class RazeCore {
    class func colorFromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
      let r, g, b: CGFloat
      let offset = hexString.hasPrefix("#") ? 1 : 0
      let start = hexString.index(hexString.startIndex, offsetBy: offset)
      let hexColor = String(hexString[start...])
      let scanner = Scanner(string: hexColor)
      var hexNumber: UInt64 = 0
      if scanner.scanHexInt64(&hexNumber) {
        r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        b = CGFloat(hexNumber & 0x0000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
      }
      return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
}
