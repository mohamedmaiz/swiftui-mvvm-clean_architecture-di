# Navigation Module

## Overview

The **Navigation** module manages app-wide navigation and routing. It provides a centralized navigation system using SwiftUI's `NavigationStack` with type-safe routing through the `AppRoute` enum. This module coordinates navigation between feature modules while maintaining separation of concerns.

## Architecture

The navigation module implements a **Coordinator-like pattern** adapted for SwiftUI:
- Centralized routing through `AppRouter`
- Type-safe route definitions via `AppRoute` enum
- Feature-specific router builders
- Route mapping between feature routes and app routes

## Structure

```
Navigation/
├── AppRootView.swift                  # Root view with NavigationStack
├── AppRouter.swift                    # Central navigation router
├── AppRoute.swift                     # App-level route enum
├── FeatureRouterBuilder.swift         # Factory for feature routers
├── RouteMappers/
│   └── PodcastsRouteMapper.swift      # Maps feature routes to app routes
└── Destinations/
    └── PodcastsDestinationBuilder.swift    # Destination view builders
```

## Components

### AppRouter

An `ObservableObject` that manages the navigation stack state.

**Key Features:**
- Uses SwiftUI's `NavigationPath` for type-erased navigation
- Provides methods for navigation operations:
  - `push(_ route:)`: Navigate to a new route
  - `pop()`: Navigate back
  - `reset(to:)`: Reset navigation stack

**Usage:**
```swift
let router = AppRouter()
router.push(.podcastDetails(id: 123))
router.pop()
```

### AppRoute

Type-safe enum defining all possible routes in the application.

**Current Routes:**
- `.podcastDetails(id: Int)`: Navigate to podcast details screen

**Extensibility:**
New routes can be added to this enum to support additional features.

### AppRootView

The root view of the application that:
- Sets up the `NavigationStack`
- Configures navigation destinations
- Initializes the dependency container
- Wires feature modules to the navigation system

**Key Responsibilities:**
- Navigation stack setup
- Route-to-view mapping
- Dependency injection coordination

### FeatureRouterBuilder

A factory class that creates feature-specific routers and connects them to the app-level router.

**Key Features:**
- Converts feature-specific routes to app-level routes
- Maintains separation between feature modules and navigation
- Provides feature routers with callbacks to the app router

**Usage:**
```swift
let routerBuilder = FeatureRouterBuilder(appRouter: appRouter)
let podcastsRouter = routerBuilder.makePodcastsRouter()
```

### RouteMappers

Converts feature-specific route types to app-level `AppRoute` enum cases.

#### PodcastsRouteMapper

Maps `PodcastsRoute` (from Podcasts feature) to `AppRoute`.

### Destinations

Contains destination builders for navigation destinations (if needed for complex navigation scenarios).

## Navigation Flow

1. **Feature Module** triggers navigation using its feature router
2. **Feature Router** calls app router callback
3. **Route Mapper** converts feature route to app route
4. **App Router** pushes route to navigation stack
5. **AppRootView** resolves route to destination view
6. **NavigationStack** displays the destination

## Integration with Feature Modules

Feature modules provide their own router protocols (e.g., `PodcastsRouting`) that are implemented by routers created by `FeatureRouterBuilder`. This maintains:
- **Decoupling**: Feature modules don't know about app-level routing
- **Type Safety**: Routes are checked at compile time
- **Testability**: Feature routers can be easily mocked

## Example Usage

```swift
// In a feature module
protocol PodcastsRouting {
    func navigateToDetails(id: Int)
}

// In Navigation module
class FeatureRouterBuilder {
    func makePodcastsRouter() -> PodcastsRouter {
        PodcastsRouter { [weak self] route in
            self?.appRouter.push(.fromPodcastsRoute(route))
        }
    }
}

// In AppRootView
NavigationStack(path: $appRouter.path) {
    // Initial view
    .navigationDestination(for: AppRoute.self) { route in
        switch route {
        case .podcastDetails(let id):
            // Build and show podcast details view
        }
    }
}
```

## Testing

The navigation module can be tested by:
- Mocking `AppRouter` to verify route pushes
- Testing route mapper conversions
- Verifying navigation destinations are correctly resolved

## Future Enhancements

- Deep linking support
- Navigation state persistence
- Tab-based navigation
- Modal presentation coordination
