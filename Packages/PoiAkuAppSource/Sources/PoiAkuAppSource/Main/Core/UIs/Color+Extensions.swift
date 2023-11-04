//
//  Color+Extensions.swift
//  Created by Daniel Prastiwa on 04/11/23.
//

import Foundation
import SwiftUI
import UIKit


public enum ColorHex: Int {
  case backgroundAlbum = 0xFAF7F3
  case black = 0x000000
  case white = 0xFFFFFF
}


extension Color {

  public static func colorHex(_ hex: ColorHex) -> Color {
    Color(uiColor: UIColor(hex.rawValue))
  }
}


extension UIColor {

  // MARK: - Methods
  /// Hex sRGB color initializer.
  ///
  /// - parameter hex: Pass in a sRGB color integer using hex notation, i.e. 0xFFFFFF. Make sure to only include 6 hex digits.
  ///
  /// - returns: Initialized opaque UIColor, i.e. alpha is set to 1.0.
  public convenience init(_ hex: Int) {
    assert(
      0...0xFFFFFF ~= hex,
      "UIColor+Hex: Hex value given to UIColor initializer should only include RGB values, i.e. the hex value should have six digits." //swiftlint:disable:this line_length
    )
    let red = (hex & 0xFF0000) >> 16
    let green = (hex & 0x00FF00) >> 8
    let blue = (hex & 0x0000FF)
    self.init(red: red, green: green, blue: blue)
  }

  /// RGB integer color initializer.
  ///
  /// - parameter red:   Red component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
  ///                    and above uses an extended color space to support wide color.
  /// - parameter green: Green component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
  ///                    and above uses an extended color space to support wide color.
  /// - parameter blue:  Blue component as integer. In iOS 9 or below, this value should be between 0 and 255. iOS 10
  ///                    and above uses an extended color space to support wide color.
  ///
  /// - returns: Initialized opaque UIColor, i.e. alpha is set to 1.0.
  public convenience init(red: Int, green: Int, blue: Int) {
    self.init(
      red: CGFloat(red) / 255.0,
      green: CGFloat(green) / 255.0,
      blue: CGFloat(blue) / 255.0,
      alpha:  1.0
    )
  }

  public convenience init(string: String = "#FFFFFF") {
    var chars = Array(string.hasPrefix("#") ? "\(string.dropFirst())" : string)
    var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
    switch chars.count {
    case 3:
      chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
      fallthrough
    case 6:
      chars = ["F","F"] + chars
      fallthrough
    case 8:
      alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
      red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
      green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
      blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
    default:
      alpha = 0
    }
    self.init(red: red, green: green, blue:  blue, alpha: alpha)
  }

}
