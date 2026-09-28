# Shree Video Creator

A modern Android-first Flutter app for cutting, previewing, adding text overlays, selecting music, setting aspect ratios, and preparing videos for export.

## Features
- Splash screen with animated branding
- Home dashboard with quick tools and recent projects
- Media picker for videos and photos
- Video preview and editor UI
- Text overlay editor with bold, size, position, and colour controls
- Aspect ratio selection
- Project list saved locally with SharedPreferences
- Export settings screen and placeholder export flow
- Theme built with Material 3 and deep orange primary color

## Requirements
- Flutter SDK 3.3+
- Android Studio or VS Code with Flutter tools
- Emulator or physical Android device

## Setup
1. Clone the repository.
2. Ensure Flutter is installed and available on your PATH.
3. Run:

```bash
flutter pub get
```

4. Start the app:

```bash
flutter run
```

## Notes
- The app uses a placeholder export engine until FFmpeg/native render logic is connected.
- Export will show a clear message instead of pretending a video was successfully processed.
- This MVP is designed so FFmpeg or native Android rendering can be plugged in behind the `ExportService` interface later without rewriting the UI.
