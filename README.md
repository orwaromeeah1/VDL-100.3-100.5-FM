# VDL — صوت لبنان (Voice of Lebanon)

A Flutter mobile application for **VDL 100.3 / 100.5 FM**, Lebanon's Voice of Lebanon radio station. The app delivers live audio streaming, news, radio programs, and push notifications for Android and iOS.

---

## Features

| Section | Description |
|---|---|
| **News** | 4 tabs — Latest News, Special Reports, Articles, News Broadcasts. Infinite scroll, category filter, full-text search, Twitter/X feed. |
| **Programs** | Grid of radio programs with episode listings and in-app audio playback. |
| **Live Broadcast** | Live audio stream and live video feed. |
| **Schedule** | Weekly program timetable. |
| **Menu** | Articles, Newscasts, About Us, Contact Us, notification toggle, social media links. |
| **Notifications** | Push notifications via OneSignal — tapping a notification navigates directly to the relevant news article. |
| **Onboarding** | Intro screen shown on first launch. |

---

## Tech Stack

- **Framework:** Flutter (Dart 3 / null-safe)
- **State Management:** BLoC (`flutter_bloc` 8.x) — 13 BLoCs across the app
- **Dependency Injection:** GetIt
- **Backend:** WordPress REST API
- **Auth:** OAuth 2.0 with token refresh
- **Push Notifications:** OneSignal
- **Analytics:** Firebase Analytics
- **Ads:** Google Mobile Ads (AdMob)
- **Audio:** `just_audio` + `audio_service` (iOS/background), `just_audio` direct (Android)
- **In-App Web:** `flutter_inappwebview`
- **Images:** `cached_network_image`

---

## Architecture

```
lib/
├── core/           # Utilities, HTML parsing, toast helpers
├── data/
│   ├── models/     # Data models
│   ├── networking/ # HTTP client with auth token injection
│   ├── repository/ # Single data source with in-memory cache
│   ├── requests/   # Request DTOs
│   └── responses/  # Response DTOs
├── ui/             # Feature screens
│   └── <feature>/
│       ├── bloc/   # Events / States / Bloc
│       ├── page/   # Screens
│       └── widgets/
├── utils/          # Colors, URLs, ads, date helpers
├── injection.dart  # GetIt registrations
└── main.dart       # Entry point
```

---

## Getting Started

### Prerequisites

- Flutter SDK (Dart ≥ 3.0)
- Android Studio or Xcode
- A Firebase project (`google-services.json` / `GoogleService-Info.plist`)

### Setup

```bash
# 1. Clone the repo
git clone https://github.com/orwaromeeah1/VDL-100.3-100.5-FM.git
cd VDL-100.3-100.5-FM

# 2. Copy the example secrets and fill in your own keys
cp android/app/google-services.json.example android/app/google-services.json
# edit lib/utils/secrets/app_keys.dart
# edit lib/utils/secrets/twitterKeys.dart
# edit lib/ui/ContactUs/pages/contact_us_page.dart  (SendGrid key)

# 3. Install dependencies
flutter pub get

# 4. Run
flutter run
```

### Required Secrets

| File | Keys needed |
|---|---|
| `lib/utils/secrets/app_keys.dart` | WordPress OAuth2 client key & secret (Android + iOS) |
| `lib/utils/secrets/twitterKeys.dart` | Twitter API v2 key, secret, bearer token |
| `android/app/google-services.json` | Firebase project config |
| `lib/ui/ContactUs/pages/contact_us_page.dart` | SendGrid API key |

---

## Build

```bash
# Android release APK
flutter build apk --release

# iOS
flutter build ios --release
```

---

## License

This project is for portfolio and educational purposes.
