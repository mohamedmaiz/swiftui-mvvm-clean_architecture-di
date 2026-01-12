//
//  UIColor+Hex.swift
//  Core
//
//  Created by Mohamed Maiz on 10/01/2026.
//

import UIKit

public extension UIColor {
    
    convenience init?(hex: String, alpha: CGFloat? = nil) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexString = hexString.replacingOccurrences(of: "#", with: "")
        
        guard hexString.count == 6 || hexString.count == 8 else {
            return nil
        }
        
        var hexNumber: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&hexNumber) else {
            return nil
        }
        
        let r, g, b, a: CGFloat
        
        if hexString.count == 8 {
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        } else {
            r = CGFloat((hexNumber & 0xFF0000) >> 16) / 255
            g = CGFloat((hexNumber & 0x00FF00) >> 8) / 255
            b = CGFloat(hexNumber & 0x0000FF) / 255
            a = alpha ?? 1.0
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}

