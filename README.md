# VDL 100.3 / 100.5 FM — Flutter Radio App

A full-featured, production-ready mobile radio app for **VDL 100.3 & 100.5 FM**, built with Flutter for iOS and Android. Developed at **DLimits Digital Limits** (Lebanon) — from design to App Store deployment.

> ⚠️ **Note:** This repository is shared for **portfolio purposes only**. The code is not licensed for redistribution or reuse.

---

## 📲 Live on the App Store & Google Play

[<img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" height="50">](https://apps.apple.com/de/app/vdl-100-3-100-5-fm/id418516868?l=en-GB)
&nbsp;&nbsp;
[<img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" height="50">](https://play.google.com/store/apps/details?id=com.vdl.stream&hl=en)

> **Version:** 3.1.3 (Build 46)

---

## Features

- 🎵 **Live radio streaming** — real-time audio playback for VDL 100.3 and 100.5 FM
- 🔇 **Background playback** — keeps playing when the app is minimized or the screen is locked
- 🔔 **Push notifications** — powered by OneSignal for news and program alerts
- 📊 **Analytics** — Firebase Analytics integration for usage insights
- 💾 **Persistent preferences** — remembers user settings across sessions
- 📱 **In-app web content** — embedded web views for news and show pages
- 🔄 **Auto-update prompts** — notifies users when a new version is available
- 📢 **Ad integration** — Google Mobile Ads for monetization

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | BLoC pattern (`flutter_bloc`, `bloc`, `equatable`) |
| Dependency Injection | `get_it` |
| Audio | `just_audio`, `audio_service`, `just_audio_background`, `audioplayers` |
| Push Notifications | OneSignal (`onesignal_flutter`) |
| Analytics | Firebase Analytics |
| Ads | Google Mobile Ads |
| Local Storage | `shared_preferences` |
| Web Content | `webview_flutter`, `flutter_inappwebview` |
| Networking | `http` |
| UI | Material Design, custom fonts (TheSans), SVG assets |

---

## Architecture

The app follows the **BLoC (Business Logic Component)** pattern for clean separation of UI and business logic, combined with **GetIt** for dependency injection. This ensures testability, scalability, and maintainability as the codebase grows.

```
lib/
├── blocs/          # BLoC state management
├── models/         # Data models
├── repositories/   # Data layer
├── screens/        # UI screens
├── widgets/        # Reusable UI components
└── main.dart       # Entry point
```

---

## Platforms

| Platform | Status |
|---|---|
| iOS | ✅ Live on App Store |
| Android | ✅ Live on Google Play |

---

## Key Technical Highlights

- Implementing **background audio** on both iOS and Android (a notoriously tricky area in Flutter)
- Integrating **BLoC architecture** for scalable, testable state management
- Setting up **Firebase** and **OneSignal** in a real production environment
- Managing **Google Mobile Ads** lifecycle within a media playback app
- Maintaining and shipping a real app across **46+ builds**

---
