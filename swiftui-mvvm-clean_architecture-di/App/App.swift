//
//  swiftui_mvvm_clean_architecture_diApp.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 02/01/2026.
//

import SwiftUI
import Core

@main
struct swiftui_mvvm_clean_architecture_diApp: App {
    init () {
        NavigationBarStyle.apply()
    }
    var body: some Scene {
        WindowGroup {
            AppRootView()
        }
    }
}
