# Yuu Sell

A Flutter-based cargo and logistics application for international shipping services. Users can calculate delivery costs, create parcels, track shipments, and choose from multiple cargo options including air, truck, and sea freight.

## Features

- **Multiple Cargo Services**:
  - Air Cargo (Econom & Express options)
  - Truck Cargo
  - Sea Cargo (LCL & FCL shipping)
- **Delivery Calculator**: Calculate shipping costs between countries and cities
- **Parcel Management**: Create and track parcels with step-by-step workflow
- **Package Tracking**: Track shipments in real-time
- **Authentication**: User registration and login with API integration
- **Messaging System**: In-app communication for shipment updates
- **Responsive Design**: Adaptive sizing system that scales across different screen sizes
- **Bottom Navigation**: Persistent navigation with Home, Messages, Truck, and Profile tabs

## Architecture

The app follows **Clean Architecture** with three layers:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation                          │
│         (Screens, Widgets, Providers)                   │
├─────────────────────────────────────────────────────────┤
│                      Domain                              │
│            (Entities, Repositories)                      │
├─────────────────────────────────────────────────────────┤
│                       Data                               │
│    (Models, Repository Impl, Remote DataSources)        │
└─────────────────────────────────────────────────────────┘
```

### State Management

The app uses **Provider** for state management with a clean separation of concerns:

- `AuthProvider` - Manages authentication state (login, register, logout)
- Providers are initialized via dependency injection in `InjectionContainer`

### API Integration

- **Dio** HTTP client with interceptors for authentication and logging
- **Result pattern** (`Success`/`Failure`) for clean error handling
- Repository pattern for data access abstraction

## Packages Used

| Package | Version | Description |
|---------|---------|-------------|
| [go_router](https://pub.dev/packages/go_router) | ^16.2.1 | Declarative routing solution |
| [provider](https://pub.dev/packages/provider) | ^6.1.2 | State management |
| [dio](https://pub.dev/packages/dio) | ^5.9.0 | HTTP client for API requests |
| [pinput](https://pub.dev/packages/pinput) | ^6.0.1 | PIN/OTP input widget |
| [intl_phone_number_input](https://pub.dev/packages/intl_phone_number_input) | ^0.7.5 | Phone number input with country codes |
| [flutter_svg](https://pub.dev/packages/flutter_svg) | ^2.2.1 | SVG rendering support |
| [country_picker](https://pub.dev/packages/country_picker) | ^2.0.27 | Country selection widget |
| [google_fonts](https://pub.dev/packages/google_fonts) | ^6.2.1 | Google Fonts support |
| [shimmer](https://pub.dev/packages/shimmer) | ^3.0.0 | Loading shimmer effects |
| [mobile_scanner](https://pub.dev/packages/mobile_scanner) | ^6.0.2 | QR code scanning |

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/yuu_sell.git
cd yuu_sell
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure the API base URL in `lib/core/network/api_constants.dart`:
```dart
static const String baseUrl = 'https://your-api-url.com';
```

4. Run the app:
```bash
flutter run
```

### Build

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release
```

## Project Structure

```
lib/
├── core/
│   ├── constants/          # App sizing utilities
│   ├── di/                 # Dependency injection
│   │   └── injection_container.dart
│   ├── errors/             # Error handling
│   │   ├── api_exception.dart
│   │   └── result.dart     # Success/Failure pattern
│   ├── network/            # API configuration
│   │   ├── api_constants.dart
│   │   └── dio_client.dart
│   ├── router/             # Navigation (go_router)
│   └── theme/              # Colors and typography
├── data/
│   ├── datasources/
│   │   └── remote/         # API calls
│   ├── models/             # DTOs (JSON serialization)
│   └── repositories/       # Repository implementations
├── domain/
│   ├── entities/           # Business entities
│   └── repositories/       # Repository contracts
├── presentation/
│   ├── providers/          # State management
│   ├── screens/
│   │   ├── air_cargo/      # Air freight services
│   │   ├── car_cargo/      # Truck freight services
│   │   ├── sea_cargo/      # Sea freight (LCL/FCL)
│   │   ├── calculate/      # Delivery cost calculator
│   │   ├── create_parcel/  # Parcel creation flow
│   │   ├── home/           # Home screen
│   │   ├── messages/       # Messaging system
│   │   ├── profile/        # User profile & settings
│   │   └── register/       # Auth screens
│   └── widgets/            # Reusable UI components
└── main.dart
```

## Navigation

The app uses `go_router` with `StatefulShellRoute` for bottom navigation persistence.

### Route Structure

```
/splash              -> SplashScreen
/sign-up             -> SignUpPage
/login               -> LogInPage

/home                -> HomePage (Tab 0)
  /delivery-calculate    -> DeliveryCalculatePage
  /air-cargo             -> AirCargoPage
  /car-cargo             -> CarCargoPage
  /sea-cargo             -> SeaCargoPage

/messages            -> MessagesPage (Tab 1)
/truck               -> TruckPage (Tab 2)
/profile             -> ProfilePage (Tab 3)
```

### Navigation Usage

```dart
// Navigate and replace (no back)
context.go(AppRoutes.home);

// Push (can pop back)
context.push(AppRoutes.login);

// Navigate by name
context.goNamed('airCargo');

// Pop back
context.pop();
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/auth/register` | POST | User registration |
| `/auth/login` | POST | User login |
| `/auth/logout` | POST | User logout |

## Usage Examples

### Authentication

```dart
// Access provider
final authProvider = context.read<AuthProvider>();

// Register
await authProvider.register(
  email: 'user@example.com',
  phone: '+1234567890',
  password: 'password123',
);

// Login
await authProvider.login(
  emailOrPhone: 'user@example.com',
  password: 'password123',
);

// Check auth state
if (authProvider.isAuthenticated) {
  // User is logged in
}

// Logout
await authProvider.logout();
```

### Error Handling

```dart
// Using Result pattern
final result = await authRepository.login(request);

result.when(
  success: (user) {
    // Handle success
  },
  failure: (message, statusCode) {
    // Handle error
  },
);
```
