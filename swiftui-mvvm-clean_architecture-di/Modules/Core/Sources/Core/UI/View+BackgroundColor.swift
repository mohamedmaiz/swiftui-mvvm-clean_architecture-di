//
//  View+BackgroundColor.swift
//  Core
//
//  Created by Mohamed Maiz on 06/01/2026.
//
import SwiftUI

public struct Screen<Background: View, Content: View>: View {
    private let ignoresSafeArea: Bool
    private let background: Background
    private let content: Content
    
    public init(
        ignoresSafeArea: Bool = true,
        @ViewBuilder background: () -> Background,
        @ViewBuilder content: () -> Content
    ) {
        self.ignoresSafeArea = ignoresSafeArea
        self.background = background()
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            background.ignoresSafeAreaIfNeeded(ignoresSafeArea)
            content
        }
    }
}

// MARK: - Convenience initializers
public extension Screen where Background == Color {
    init(
        _ color: Color,
        ignoresSafeArea: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.init(ignoresSafeArea: ignoresSafeArea) {
            color
        } content: {
            content()
        }
    }
}

public extension Screen where Background == LinearGradient {
    init(
        _ gradient: LinearGradient,
        ignoresSafeArea: Bool = true,
        @ViewBuilder content: () -> Content
    ) {
        self.init(ignoresSafeArea: ignoresSafeArea) {
            gradient
        } content: {
            content()
        }
    }
}

// MARK: - Helpers
public extension View {
    @ViewBuilder
    func applySafeAreaIfNeeded(_ enabled: Bool) -> some View {
        if enabled {
            self.ignoresSafeArea()
        } else {
            self
        }
    }
}





