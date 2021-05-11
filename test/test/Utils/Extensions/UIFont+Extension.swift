//
//  UIFont+Extension.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import Foundation
import UIKit

extension UIFont {
    /**
     *  Instantiate a Dynamic Font
     *
     * - parameter style : Text Style: default body
     * - parameter FontType : Type of  Text font.
     * - parameter size: Font size.
     */
    class func dynamicFont(style: UIFont.TextStyle = .body, type: FontType, size fontSize: CGFloat ) -> UIFont {
        
        let font = UIFont(name: type.rawValue, size: fontSize)!
        let dynamicFont = UIFontMetrics.init(forTextStyle: style).scaledFont(for: font)
        return dynamicFont
    }
}
