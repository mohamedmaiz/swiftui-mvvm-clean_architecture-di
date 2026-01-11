//
//  NavigationBarStyle.swift
//  Core
//
//  Created by Mohamed Maiz on 10/01/2026.
//

import UIKit

public enum NavigationBarStyle {
    @MainActor
    public static func apply(
        blurStyle: UIBlurEffect.Style = .systemUltraThinMaterialDark,
        tintColor: UIColor = .white,
        titleColor: UIColor = .white
    ) {
        // When SCROLLED (content under the bar) → show blur
        let standard = UINavigationBarAppearance()
        standard.configureWithTransparentBackground()
        standard.backgroundEffect = UIBlurEffect(style: blurStyle)
        standard.backgroundColor = .clear
        standard.titleTextAttributes = [.foregroundColor: titleColor]
        standard.largeTitleTextAttributes = [.foregroundColor: titleColor]
        
        // When at TOP (no content under bar) → NO blur (fully transparent)
        let scrollEdge = UINavigationBarAppearance()
        scrollEdge.configureWithTransparentBackground()
        scrollEdge.backgroundEffect = nil
        scrollEdge.backgroundColor = .clear
        scrollEdge.titleTextAttributes = [.foregroundColor: titleColor]
        scrollEdge.largeTitleTextAttributes = [.foregroundColor: titleColor]
        
        let navBar = UINavigationBar.appearance()
        navBar.standardAppearance = standard
        navBar.compactAppearance = standard
        navBar.scrollEdgeAppearance = scrollEdge
        navBar.tintColor = tintColor
    }
}

