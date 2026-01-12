# Podcasts App - SwiftUI MVVM Clean Architecture

An iOS podcast discovery application built with SwiftUI, following Clean Architecture principles with MVVM pattern and Dependency Injection.

## Requirements

### Functional
* Fetching and parsing data from Apple Podcasts API
* Listing podcasts by categories (Technology, Language Learning, Business, TED Talks)
* Searching podcasts with debounced search
* Search suggestions (SwiftUI searchable)
* Navigation to podcast details view
* Dark mode with gradient backgrounds

### Non-Functional

**Performance:**
* Caching images with Kingfisher

**Scalability:**
* Modular architecture (Core, Podcasts, PodcastDetails modules)

**Reliability:**
* Unit tests

## Design Decisions

**UI:**
* SwiftUI
* MVVM Architecture

**Principals and Patterns:**
* SOLID conformance:
    * Features are separated into modules
    * UseCases for business logic
* Utilizing IoC and DI (Inversion of Control and Dependency Injection) with FeatureBuilder pattern:
    * FeatureBuilder is a factory pattern for Dependency Injection
    * Each feature module has a FeatureBuilder that composes the dependency graph (Remote → Repository → UseCase → ViewModel → View)
    * Provides factory methods to create screens with all dependencies properly wired
    * Centralizes dependency composition and makes testing easier
* Coordinator pattern for navigation
* PreviewSupport pattern:
    * Each feature module includes a PreviewSupport folder with mock implementations
    * Contains mock repositories, mock routers, and test fixtures
    * Used exclusively for SwiftUI previews and development
    * Code is wrapped in `#if DEBUG` to exclude from release builds

**Dependency Manager:**
* Swift Package Manager

**Dependencies:**
* Kingfisher: Downloading and caching images from the web

## What could be improved

* Add local data storage (Core Data/Realm) to Repository pattern for offline support

