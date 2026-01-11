//
//  AppRouter.swift
//  swiftui-mvvm-clean_architecture-di
//
//  Created by Mohamed Maiz on 09/01/2026.
//

import Foundation
import SwiftUI

final class AppRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    init() {}
    
}

extension AppRouter {
    
    func push(_ route: AppRoute){
        path.append(route)
    }
    
    func pop() {
        if path.count <= 1 {return}
        path.removeLast()
    }
    
    func reset(to root: AppRoute? = nil) {
        path = NavigationPath()
        if let root { path.append(root) }
    }
    
}
