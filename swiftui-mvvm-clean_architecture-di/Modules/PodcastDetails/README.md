# PodcastDetails Module

## Overview

The **PodcastDetails** module is a feature module that implements the podcast details screen functionality. It follows **Clean Architecture** principles with a clear separation of concerns across Data, Domain, and Presentation layers, combined with **MVVM** pattern for the presentation layer.

## Architecture

This module implements Clean Architecture with three main layers:

1. **Domain Layer**: Business logic, models, and use cases (business rules)
2. **Data Layer**: Data sources, repositories, DTOs, and data mapping
3. **Presentation Layer**: ViewModels (MVVM), Views, and components

The module also includes a **Dependency Injection (DI)** layer for composing dependencies.

## Structure

```
PodcastDetails/
├── Domain/
│   ├── Models/
│   │   ├── PodcastDetails.swift           # Domain model
│   │   └── PagedResult.swift              # Pagination model
│   ├── Repositories/
│   │   └── PodcastDetailsRepositoryProtocol.swift  # Repository interface
│   └── Usecases/
│       └── PodcastDetailsUseCase.swift    # Business logic
├── Data/
│   ├── DTOs/
│   │   ├── PodcastDetailsDTO.swift        # Data Transfer Object
│   │   └── PagedResponse.swift            # API response model
│   ├── Endpoints/
│   │   └── FetchPodcastDetailsEndpoint.swift  # API endpoint definitions
│   ├── Mappers/
│   │   └── PodcastDetailsMapper.swift     # DTO to Domain mapper
│   ├── Remote/
│   │   └── PodcastDetailsRemoteData.swift # Remote data source
│   └── Repositories/
│       └── PodcastDetailsRepository.swift # Repository implementation
├── Presentation/
│   ├── ViewModel/
│   │   ├── PodcastDetailsViewModel.swift  # ViewModel (MVVM)
│   │   └── States/
│   │       └── ViewState.swift            # View state enum
│   └── Views/
│       ├── Screen/
│       │   └── PodcastDetailsScreen.swift # Main screen
│       └── Components/
│           └── PlayLastestEpisodeView.swift  # Latest episode component
├── DI/
│   └── PodcastDetailsFeatureBuilder.swift # Dependency injection
└── PreviewSupport/
    ├── MockPodcastDetailsRepository.swift  # Mock for previews
    └── Podcast+Fixtures.swift              # Test data
```

## Components

### Domain Layer

#### Models

- **PodcastDetails**: Core domain model representing detailed podcast information
  - Extends basic podcast properties (id, title, artist name, artwork URLs, etc.)
  - Includes additional details like `genreIds` and `genres` arrays
- **PagedResult**: Model for paginated results (if needed for future enhancements)

#### Repository Protocol

- **PodcastDetailsRepositoryProtocol**: Defines the interface for podcast details data operations
  - `fetchDetails(id:)`: Fetch detailed information for a specific podcast by ID

#### Use Case

- **PodcastDetailsUseCase**: Contains business logic for podcast details operations
  - Orchestrates repository calls
  - Implements business rules
  - Returns Combine publishers for reactive data flow

### Data Layer

#### DTOs (Data Transfer Objects)

- **PodcastDetailsDTO**: API response model that maps to domain `PodcastDetails`
- **PagedResponse**: Generic paginated API response wrapper

#### Endpoints

- **FetchPodcastDetailsEndpoint**: Defines API endpoint for:
  - Fetching detailed information for a specific podcast by ID

#### Mappers

- **PodcastDetailsMapper**: Converts `PodcastDetailsDTO` to domain `PodcastDetails` model
  - Handles data transformation between API and domain models
  - Maps additional fields like `genreIds` and `genres`

#### Remote Data Source

- **PodcastDetailsRemoteData**: Implements remote data fetching using `APIClient`
  - Converts endpoints to API calls
  - Returns DTOs

#### Repository Implementation

- **PodcastDetailsRepository**: Implements `PodcastDetailsRepositoryProtocol`
  - Coordinates data sources (remote, local if implemented)
  - Maps DTOs to domain models
  - Handles data transformation
  - Extracts first result from API response array

### Presentation Layer

#### ViewModel (MVVM)

- **PodcastDetailsViewModel**: `ObservableObject` that manages view state
  - Published properties for UI state
  - Business logic coordination
  - Reactive data binding using Combine

**State Management:**
- `details`: Published podcast details (optional)
- `state`: View state (idle, loading, loaded, error, empty)

**Key Methods:**
- `viewDidLoad(id:)`: Initializes data fetching for the given podcast ID
- `fetchPodcastDetails(id:)`: Private method that fetches podcast details

#### Views

- **PodcastDetailsScreen**: Main screen view
  - Displays podcast details based on view state
  - Custom navigation bar with back button
  - Gradient background using Core module's `Screen` component
  - Lifecycle management using `onViewDidLoad` extension

**View States:**
- `.idle` / `.loading`: Shows progress indicator
- `.loaded`: Displays podcast details content
- `.error`: Displays error message
- `.empty`: Displays "No Data" message

- **PlayLastestEpisodeView**: Component for displaying and playing the latest episode

### Dependency Injection

#### PodcastDetailsFeatureBuilder

Factory class that composes all dependencies:

```swift
public func makePodcastDetailsScreen(id: Int) -> PodcastDetailsScreen {
    let remote = PodcastDetailsRemoteData(client: apiClient)
    let repo = PodcastDetailsRepository(remote: remote)
    let useCase = PodcastDetailsUseCase(podcastsRepository: repo)
    let vm = PodcastDetailsViewModel(podcastDetailsUseCase: useCase)
    return PodcastDetailsScreen(vm: vm, id: id)
}
```

**Key Features:**
- Dependency composition
- Factory methods for creating views
- Mock factory methods for SwiftUI previews

## Data Flow

1. **Navigation** → User navigates to podcast details screen with podcast ID
2. **Screen Initialization** → `PodcastDetailsScreen` is created with ViewModel and ID
3. **View Lifecycle** → `onViewDidLoad` triggers `viewDidLoad(id:)`
4. **ViewModel** → Calls `fetchPodcastDetails(id:)`
5. **Use Case** → Calls Repository protocol method `fetchDetails(id:)`
6. **Repository** → Fetches from Remote Data Source
7. **Remote Data** → Uses APIClient to make API call
8. **API Response** → Returns DTO
9. **Repository** → Maps DTO to Domain Model (extracts first result)
10. **Use Case** → Returns Domain Model (Publisher)
11. **ViewModel** → Updates published properties (`details`, `state`)
12. **View** → Reacts to state changes and displays podcast details

## Dependencies

- **Core**: Networking (`APIClient`), UI components (`Screen`), utilities
- **Kingfisher**: Image loading and caching library

## Usage

```swift
// In AppContainer
let podcastDetailsFeature = container.makePodcastDetailsFeature()
let screen = podcastDetailsFeature.makePodcastDetailsScreen(id: podcastId)

// In Navigation (AppRootView)
case .podcastDetails(let id):
    return container.makePodcastDetailsFeature().makePodcastDetailsScreen(id: id)
```

## Testing

The module includes:
- **MockPodcastDetailsRepository**: For testing ViewModels and UseCases
- **Podcast+Fixtures**: Test data fixtures
- Unit tests in `Tests/PodcastDetailsTests/`

## Platform Support

- **Minimum iOS Version**: iOS 16.0
- **Swift Version**: Swift 6.0

## Key Features

- **Reactive Programming**: Uses Combine for data flow
- **State Management**: Comprehensive state management (idle, loading, loaded, error, empty)
- **Custom Navigation**: Custom back button with dismiss functionality
- **Gradient Background**: Beautiful gradient background using Core's `Screen` component
- **Image Loading**: Uses Kingfisher for efficient image loading
- **Lifecycle Management**: Proper view lifecycle handling with `onViewDidLoad`
- **Type Safety**: Type-safe navigation with podcast ID

## UI Components

- **Gradient Background**: Custom gradient using Core module's `Screen` wrapper
- **Custom Navigation Bar**: Hidden default navigation bar with custom back button
- **Latest Episode Player**: Component for playing the latest episode (if implemented)
- **Loading States**: Progress indicators during data loading
- **Error Handling**: User-friendly error messages

## Future Enhancements

- Episode list display
- Episode playback functionality
- Subscribe/Unsubscribe functionality
- Share functionality
- Favorite/bookmark functionality
- Related podcasts suggestions
- Comments/Reviews section
- Download episodes for offline playback
