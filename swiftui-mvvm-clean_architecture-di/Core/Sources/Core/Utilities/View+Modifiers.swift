//
//  View+Modifiers.swift
//  Core
//
//  Created by Mohamed Maiz on 06/01/2026.
//
import SwiftUI

public extension View {
    @ViewBuilder
    func ignoresSafeAreaIfNeeded(_ enabled: Bool) -> some View {
        if enabled { self.ignoresSafeArea() } else { self }
    }
}
