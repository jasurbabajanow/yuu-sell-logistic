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
- **Authentication Flow**: Sign up and OTP verification with countdown timer
- **Messaging System**: In-app communication for shipment updates
- **Responsive Design**: Adaptive sizing system that scales across different screen sizes
- **Bottom Navigation**: Persistent navigation with Home, Messages, Truck, and Profile tabs

## Packages Used

- **[go_router](https://pub.dev/packages/go_router)** (^16.2.1) - Declarative routing solution for navigation management
- **[pinput](https://pub.dev/packages/pinput)** (^6.0.1) - PIN/OTP input widget with customizable styling
- **[intl_phone_number_input](https://pub.dev/packages/intl_phone_number_input)** (^0.7.5) - International phone number input with country code picker
- **[flutter_svg](https://pub.dev/packages/flutter_svg)** (^2.2.1) - SVG rendering support for scalable vector graphics
- **[dio](https://pub.dev/packages/dio)** (^5.9.0) - HTTP client for API requests and network operations

## Navigation (go_router)

The app uses `go_router` with `StatefulShellRoute` for bottom navigation persistence.

### Route Structure

```
/splash          -> SplashScreen (3 sec timer)
/sign-up         -> SignUpPage
/login           -> SignUpPage (login mode)
/otp             -> OtpPage

/home            -> HomePage (Tab 0)
  /delivery-calculate  -> DeliveryCalculatePage
  /air-cargo           -> AirCargoPage
    /econom            -> EconomPage
    /express           -> ExpressPage
  /car-cargo           -> CarCargoPage
  /sea-cargo           -> SeaCargoPage

/messages        -> MessagesPage (Tab 1)
/truck           -> TruckPage (Tab 2)
/profile         -> ProfilePage (Tab 3)
```

### App Flow

```
Splash (3 sec) -> Sign Up -> OTP -> Home (with bottom nav)
```

### Navigation Usage

```dart
// Navigate and replace (no back)
context.go(AppRoutes.home);

// Push (can pop back)
context.push(AppRoutes.otp);

// Navigate by name
context.goNamed('airCargo');
context.pushNamed('econom');

// Pop back
context.pop();
```

### Key Files

| File | Description |
|------|-------------|
| `lib/core/router/app_router.dart` | Route configuration and AppRoutes constants |
| `lib/main_page.dart` | MainPageShell with bottom navigation |
| `lib/main.dart` | MaterialApp.router setup |

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app

## Project Structure

```
lib/
├── core/
│   ├── constants/      # App sizing and constants
│   ├── router/         # go_router configuration
│   └── theme/          # Colors and typography
├── presentation/
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
│   └── widgets/        # Reusable UI components
└── main.dart
```
