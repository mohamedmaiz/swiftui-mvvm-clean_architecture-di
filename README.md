

# 🎧 Podcasts App
A modular iOS application built with SwiftUI, Combine, Dependency Injection, and Clean Architecture, designed for scalability, testability, and long-term maintainability.


https://github.com/user-attachments/assets/c5218ee4-769c-4eea-8118-c0658bc9a72c

# Project Summary 
This project aims to demonstrate how to build a scalable, modular iOS application using a clean and maintainable architecture. The app is built with SwiftUI and Combine, following modern iOS development best practices.
The iTunes API is used as a real-world data source to apply reactive programming concepts with Combine. The project showcases practical usage of common Combine publishers, operators, and patterns, including @Published, zip for combining multiple requests, flatMap for async transformations, debounce for search optimization, and operators such as map and mapError for data and error handling.
From an architectural perspective, the project applies SOLID principles, Clean Architecture, and MVVM, with a strong focus on modularity, separation of concerns, and testability. Each feature is isolated in its own module, making the codebase easier to scale, maintain, and evolve.
This repository is intended to be both a production-level architectural reference and a learning resource for junior iOS developers who want to understand how modern SwiftUI apps are structured in real-world scenarios.

## Architecture
- Modular architecture
- Clean Architecture layers
- MVVM Architecture pattern (presentation layer)
- Feature-based navigation

## Project Structure
App
├── App
├── Modules
│   ├── Podcasts
│   ├── PodcastDetails
│   └── Core
├── Navigation
└── Resources

## Navigation
- AppRouter owns the NavigationStack
- Each feature exposes its own Router
- App maps feature routes to App routes

## Dependencies
- Combine
- SwiftUI
- Kingfisher (images)

**UI:**
* SwiftUI
* MVVM Architecture
  
**Principals and Patterns:**
* SOLID conformance:
    * Features are separated into modules
    * Clear Layer Separation: Data -> Domain -> Presentation
* Utilizing IoC and DI (Inversion of Control and Dependency Injection) with FeatureBuilder pattern:
    * FeatureBuilder is a factory pattern for Dependency Injection
    * Each feature module has a FeatureBuilder that composes the dependency graph (Remote → Repository → UseCase → ViewModel → View)
    * Provides factory methods to create screens with all dependencies properly wired
    * Centralizes dependency composition and makes testing easier
    * Enables SwiftUI Previews by injecting mock ViewModels and data
* PreviewSupport pattern:
    * Each feature module includes a PreviewSupport folder with mock implementations
    * Contains mock repositories, mock routers, and test fixtures
    * Used exclusively for SwiftUI previews and development
    * Code is wrapped in `#if DEBUG` to exclude from release builds

## Requirements

### Functional
* Fetching and parsing data from Apple Podcasts API
* Listing podcasts by categories (Technology, Language Learning, Business, TED Talks)
* Searching podcasts with debounced search
* Navigation to podcast details view

### Non-Functional

**Performance:**
* Caching images with Kingfisher

**Scalability:**
* Modular architecture (Core, Podcasts, PodcastDetails modules)

**Dependency Manager:**
* Swift Package Manager

**Dependencies:**
* Kingfisher: Downloading and caching images from the web

## What could be improved
* Add local data storage (Core Data/Realm) to Repository pattern for offline support
* Unit and integration tests p

## Getting Started
1. Open `PodcastsApp.xcworkspace`
2. Select `PodcastsApp` scheme
3. Run on iPhone Simulator

## 👤 Author
Mohamed Maiz
