# Lib Folder Structure

This project follows a clean architecture pattern with separation of concerns.

## Directory Structure

### `/core`
Core utilities and shared resources used across the application.
- **constants/** - App-wide constants (API endpoints, app strings, etc.)
- **theme/** - App theme configuration (colors, text styles, etc.)
- **errors/** - Custom error/exception classes
- **utils/** - Core utility functions and extensions

### `/data`
Data layer - handles data operations and external data sources.
- **models/** - Data models with JSON serialization
- **repositories/** - Repository implementations (concrete classes)
- **datasources/**
  - **local/** - Local data sources (shared preferences, SQLite, etc.)
  - **remote/** - Remote data sources (API clients, HTTP services)

### `/domain`
Business logic layer - contains core business rules.
- **entities/** - Business entities (pure Dart objects)
- **repositories/** - Repository interfaces/contracts
- **usecases/** - Application use cases/business logic

### `/presentation`
UI layer - everything related to the user interface.
- **screens/** - Complete screen widgets
- **widgets/** - Reusable UI components
- **providers/** - State management (Provider, Riverpod, Bloc, etc.)

### `/config`
Application configuration.
- Routes configuration
- Dependency injection setup
- App initialization

### `/utils`
General utility functions and helpers that don't fit in core.
