//
//  Color+Hex.swift
//  Core
//
//  Created by Mohamed Maiz on 10/01/2026.
//

import SwiftUI

public extension Color {
    init(hex: String, default defaultColor: Color = .clear) {
        let hex = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")
        
        var value: UInt64 = 0
        guard Scanner(string: hex).scanHexInt64(&value) else {
            self = defaultColor
            return
        }
        
        switch hex.count {
        case 3: // RGB (12-bit)
            let r = Double((value >> 8) & 0xF) / 15.0
            let g = Double((value >> 4) & 0xF) / 15.0
            let b = Double(value & 0xF) / 15.0
            self = Color(red: r, green: g, blue: b)
            
        case 6: // RRGGBB
            let r = Double((value >> 16) & 0xFF) / 255.0
            let g = Double((value >> 8) & 0xFF) / 255.0
            let b = Double(value & 0xFF) / 255.0
            self = Color(red: r, green: g, blue: b)
            
        case 8: // AARRGGBB
            let a = Double((value >> 24) & 0xFF) / 255.0
            let r = Double((value >> 16) & 0xFF) / 255.0
            let g = Double((value >> 8) & 0xFF) / 255.0
            let b = Double(value & 0xFF) / 255.0
            self = Color(red: r, green: g, blue: b, opacity: a)
            
        default:
            self = defaultColor
        }
    }
}
