# Core Module

## Overview

The **Core** module is a shared library that provides foundational components, utilities, and infrastructure used across the entire application. It contains networking layer, UI components, utilities, and shared code that multiple feature modules depend on.

## Architecture

The Core module is organized into several sub-modules, each serving a specific purpose:

- **Networking**: HTTP client and API communication
- **UI**: Reusable SwiftUI components and styling
- **Utilities**: Helper extensions and utilities
- **Cache**: Caching infrastructure (placeholder for future implementation)
- **Persistence**: Data persistence layer (placeholder for future implementation)

## Structure

```
Core/
├── Networking/
│   ├── APIClient.swift          # Main HTTP client using Combine
│   ├── APIError.swift           # API error types
│   ├── Endpoint.swift           # Endpoint protocol and implementation
│   ├── HTTPMethod.swift         # HTTP method enum
│   └── NetworkLogger.swift      # Network request/response logging
├── UI/
│   ├── Appearance/
│   │   └── NavigationBarStyle.swift    # Global navigation bar styling
│   ├── ShimmerEffect.swift             # Loading shimmer effect component
│   └── View+BackgroundColor.swift      # Screen wrapper with background support
├── Utilities/
│   ├── Color+Hex.swift          # Color hex string extension
│   ├── UIColor+Hex.swift        # UIColor hex string extension
│   ├── UIImage+AverageColor.swift      # Image color extraction
│   ├── View+Modifiers.swift            # View modifier utilities
│   └── View+onViewDidLoad.swift        # View lifecycle hook
├── Cache/                       # (Reserved for future implementation)
└── Persistence/                 # (Reserved for future implementation)
```

## Components

### Networking

#### APIClient

A Combine-based HTTP client that provides:
- Type-safe API requests using generics
- Automatic JSON decoding with snake_case support
- Error handling and mapping
- Network logging integration
- Thread-safe execution (background queue for requests, main queue for results)

**Usage:**
```swift
let apiClient = APIClient()
let publisher: AnyPublisher<MyDTO, APIError> = apiClient.run(MyDTO.self, endpoint)
```

#### Endpoint Protocol

Defines the structure for API endpoints with:
- Base URL configuration
- Path specification
- HTTP method
- Request body (optional)
- Query parameters (optional)

#### APIError

Error types for network operations:
- `invalidURL`: Invalid URL construction
- `badResponse`: HTTP error responses
- `decoderError`: JSON decoding failures

#### NetworkLogger

Debugging utility that logs:
- Request details (method, URL, headers, body)
- Response details (status code, headers, body)
- Decoding errors

### UI Components

#### Screen

A reusable view wrapper that provides:
- Background support (Color or LinearGradient)
- Safe area handling
- Content composition

**Usage:**
```swift
Screen(Color.blue) {
    // Your content
}
```

#### ShimmerEffect

A loading shimmer effect component for skeleton screens during data loading.

#### NavigationBarStyle

Global navigation bar appearance configuration applied at app startup.

### Utilities

#### Color Extensions

- `Color+Hex`: Initialize `Color` from hex strings
- `UIColor+Hex`: Initialize `UIColor` from hex strings

#### UIImage Extensions

- `UIImage+AverageColor`: Extract average color from images (useful for dynamic theming)

#### View Extensions

- `View+onViewDidLoad`: Lifecycle hook similar to UIKit's `viewDidLoad`
- `View+Modifiers`: Reusable view modifiers

## Platform Support

- **Minimum iOS Version**: iOS 16.0
- **Swift Version**: Swift 6.0

## Dependencies

This module has no external dependencies and serves as the foundation for other modules.

## Usage in Other Modules

All feature modules (`Podcasts`, `PodcastDetails`) depend on the Core module to:
- Use `APIClient` for network requests
- Apply shared UI components and styling
- Utilize utility extensions

## Testing

The Core module should be thoroughly tested as it's the foundation of the application. Consider:
- Unit tests for networking layer
- UI component tests
- Utility function tests

## Future Enhancements

- **Cache**: Implement caching layer for network responses
- **Persistence**: Add data persistence capabilities (Core Data, SQLite, etc.)
