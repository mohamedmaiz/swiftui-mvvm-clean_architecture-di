# Podcasts Module

## Overview

The **Podcasts** module is a feature module that implements the podcasts list and search functionality. It follows **Clean Architecture** principles with a clear separation of concerns across Data, Domain, and Presentation layers, combined with **MVVM** pattern for the presentation layer.

## Architecture

This module implements Clean Architecture with three main layers:

1. **Domain Layer**: Business logic, models, and use cases (business rules)
2. **Data Layer**: Data sources, repositories, DTOs, and data mapping
3. **Presentation Layer**: ViewModels (MVVM), Views, and routing

The module also includes a **Dependency Injection (DI)** layer for composing dependencies.

## Structure

```
Podcasts/
├── Domain/
│   ├── Models/
│   │   ├── Podcast.swift                    # Domain model
│   │   ├── PodcastCategorySection.swift     # Section model
│   │   └── PagedResult.swift                # Pagination model
│   ├── Repositories/
│   │   └── PodcastsRepositoryProtocol.swift # Repository interface
│   └── Usecases/
│       └── PodcastsUseCase.swift            # Business logic
├── Data/
│   ├── DTOs/
│   │   ├── PodcastDTO.swift                 # Data Transfer Object
│   │   └── PagedResponse.swift              # API response model
│   ├── Endpoints/
│   │   └── FetchPodcastsEndpoint.swift      # API endpoint definitions
│   ├── Mappers/
│   │   └── PodcastMapper.swift              # DTO to Domain mapper
│   ├── Remote/
│   │   └── PodcastsRemoteData.swift         # Remote data source
│   └── Repositories/
│       └── PodcastsRepository.swift         # Repository implementation
├── Presentation/
│   ├── ViewModel/
│   │   ├── PodcastsViewModel.swift          # ViewModel (MVVM)
│   │   └── States/
│   │       └── ViewState.swift              # View state enum
│   ├── Views/
│   │   ├── Screen/
│   │   │   └── PodcastsScreen.swift         # Main screen
│   │   ├── Components/
│   │   │   ├── PodcastCardView.swift        # Podcast card component
│   │   │   ├── PodcastsContentView.swift    # Content view
│   │   │   ├── PodcastSearchCardView.swift  # Search result card
│   │   │   ├── SearchPodcastsView.swift     # Search view
│   │   │   ├── PodcsatsCategorySection.swift # Category section
│   │   │   └── Shimmers/
│   │   │       └── [Loading skeleton views]
│   │   └── Routing/
│   │       └── PodcastsRouter.swift         # Feature router
├── DI/
│   └── PodcastsFeatureBuilder.swift         # Dependency injection
└── PreviewSupport/
    ├── MockPodcastsRepository.swift         # Mock for previews
    ├── MockPodcastsRouter.swift             # Mock router
    └── Podcast+Fixtures.swift               # Test data
```

## Components

### Domain Layer

#### Models

- **Podcast**: Core domain model representing a podcast with properties like id, title, artist name, artwork URLs, etc.
- **PodcastCategorySection**: Represents a category section with title, subtitle, and podcasts array
- **PagedResult**: Model for paginated results

#### Repository Protocol

- **PodcastsRepositoryProtocol**: Defines the interface for podcast data operations
  - `searchPodcasts(query:)`: Search podcasts by query
  - `getTechnologyPodcasts()`: Fetch technology podcasts
  - `getEnglishPodcasts()`: Fetch English language learning podcasts
  - `getBusinessPodcasts()`: Fetch business podcasts
  - `getTedTalksPodcasts()`: Fetch TED Talks podcasts

#### Use Case

- **PodcastsUseCase**: Contains business logic for podcast operations
  - Orchestrates repository calls
  - Implements business rules
  - Returns Combine publishers for reactive data flow

### Data Layer

#### DTOs (Data Transfer Objects)

- **PodcastDTO**: API response model that maps to domain `Podcast`
- **PagedResponse**: Generic paginated API response wrapper

#### Endpoints

- **FetchPodcastsEndpoint**: Defines API endpoints for:
  - Search podcasts
  - Fetch podcasts by category (Technology, English, Business, TED Talks)

#### Mappers

- **PodcastMapper**: Converts `PodcastDTO` to domain `Podcast` model
- Handles data transformation between API and domain models

#### Remote Data Source

- **PodcastsRemoteData**: Implements remote data fetching using `APIClient`
- Converts endpoints to API calls
- Returns DTOs

#### Repository Implementation

- **PodcastsRepository**: Implements `PodcastsRepositoryProtocol`
- Coordinates data sources (remote, local if implemented)
- Maps DTOs to domain models
- Handles data transformation

### Presentation Layer

#### ViewModel (MVVM)

- **PodcastsViewModel**: `ObservableObject` that manages view state
  - Published properties for UI state
  - Business logic coordination
  - Search debouncing
  - Navigation handling
  - Reactive data binding using Combine

**State Management:**
- `state`: Main view state (idle, loading, loaded, error)
- `searchState`: Search-specific state
- `sections`: Category sections for display
- `searchResults`: Search results array
- `searchQuery`: Search query string

#### Views

- **PodcastsScreen**: Main screen view
  - Composes sub-components
  - Handles navigation
  - Manages view lifecycle

- **Components**:
  - `PodcastCardView`: Displays individual podcast cards
  - `PodcastsContentView`: Main content view with sections
  - `PodcastSearchCardView`: Search result cards
  - `SearchPodcastsView`: Search input and results
  - `PodcsatsCategorySection`: Category section component
  - Shimmer views: Loading skeleton screens

#### Routing

- **PodcastsRouter**: Feature-level router protocol and implementation
  - Defines navigation routes (e.g., `.details(id:)`)
  - Connects to app-level navigation system

### Dependency Injection

#### PodcastsFeatureBuilder

Factory class that composes all dependencies:

```swift
public func makePodcastsScreen(router: PodcastsRouter) -> PodcastsScreen {
    let remote = PodcastsRemoteData(client: apiClient)
    let repo = PodcastsRepository(remote: remote)
    let useCase = PodcastsUseCase(podcastsRepository: repo)
    let vm = PodcastsViewModel(podcastsUseCase: useCase, router: router)
    return PodcastsScreen(podcastsViewModel: vm)
}
```

**Key Features:**
- Dependency composition
- Factory methods for creating views
- Mock factory methods for SwiftUI previews

## Data Flow

1. **User Interaction** → View triggers ViewModel method
2. **ViewModel** → Calls UseCase method
3. **UseCase** → Calls Repository protocol method
4. **Repository** → Fetches from Remote Data Source
5. **Remote Data** → Uses APIClient to make API call
6. **API Response** → Returns DTO
7. **Repository** → Maps DTO to Domain Model
8. **UseCase** → Returns Domain Model (Publisher)
9. **ViewModel** → Updates published properties
10. **View** → Reacts to state changes and re-renders

## Dependencies

- **Core**: Networking (`APIClient`), UI components, utilities
- **Kingfisher**: Image loading and caching library

## Usage

```swift
// In AppContainer
let podcastsFeature = container.makePodcastsFeature()
let podcastsRouter = container.routerBuilder.makePodcastsRouter()
let screen = podcastsFeature.makePodcastsScreen(router: podcastsRouter)
```

## Testing

The module includes:
- **MockPodcastsRepository**: For testing ViewModels and UseCases
- **MockPodcastsRouter**: For testing navigation
- **Podcast+Fixtures**: Test data fixtures
- Unit tests in `Tests/PodcastsTests/`

## Platform Support

- **Minimum iOS Version**: iOS 16.0
- **Swift Version**: Swift 6.0

## Key Features

- **Reactive Programming**: Uses Combine for data flow
- **Search Debouncing**: Optimized search with 500ms debounce
- **Loading States**: Comprehensive state management (idle, loading, loaded, error, empty)
- **Category Sections**: Organized podcast display by categories
- **Shimmer Effects**: Loading skeleton screens
- **Image Loading**: Uses Kingfisher for efficient image loading
- **Navigation**: Type-safe routing to podcast details

## Future Enhancements

- Local caching of podcasts
- Pagination support
- Favorite/bookmark functionality
- Offline mode support
- Pull-to-refresh functionality
