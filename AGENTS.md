# AGENTS.md

## Project

- **Librotrack** is a Flutter app for library administration (Spanish UI). It is a class project with **mock data only**: no API, database, or persistence layer.
- The folder is `Librotrack`, but the package is named `app3` (`pubspec.yaml`). Imports must be `package:app3/...`; do not rename the package to match the folder without updating every import.
- Flow: `lib/main.dart` → `LibroTrackApp` (`lib/app.dart`) → `/login` → `/home` (`HomeShell`). `HomeShell` owns the Drawer and switches between Home and Libros with an `IndexedStack`.
- Auth is hardcoded in `lib/screens/login_screen.dart`: `user@librotrack.com` / `user123`. The login card shows these credentials and rejects anything else.
- Books live in `lib/data/mock_books.dart` (5 entries) and use the `Book` model in `lib/models/book.dart`. Tapping a book pushes `BookDetailScreen`, where "Solicitar préstamo" is a local mock (dialog → SnackBar → "Solicitado" state).
- Main files:
  - `lib/theme.dart` — `AppColors` + shared `ThemeData`
  - `lib/routes.dart` — only `/login` and `/home`
  - `lib/screens/` — login, home shell, home index, books list, book detail
  - `lib/widgets/book_cover.dart` — network cover with loading/error placeholder

## Commands

```bash
flutter pub get
flutter run -d chrome    # or -d edge
flutter analyze          # must stay clean
flutter test             # 2 tests: mock data + failed-login message
flutter build web        # verified; output in build/web
```

- `flutter devices` lists Windows desktop, but `flutter build windows` fails because the Visual Studio C++ toolchain is not installed. Use Chrome/Edge or `flutter build web` for verification.
- No code generation, CI, or git repository exists. Do not rely on git history or PR checks.

## Conventions & gotchas

- Keep the palette: primary `#4E796B`, background `#F8F6F1`, accent `#66B2A0`. Use `AppColors` from `lib/theme.dart` instead of scattered hex values.
- UI copy is in Spanish; keep new user-facing text in Spanish.
- Book covers and the home avatar are remote `NetworkImage`s, so they require internet at runtime. Both use fallbacks (`BookCover` / `errorBuilder`) — preserve them.
- `analysis_options.yaml` excludes `build/` and all platform directories. Those directories are stock Flutter templates; only edit them for native config.
- No assets or custom fonts are declared in `pubspec.yaml`. Adding any requires a `flutter.assets` section.
- Dart/Flutter: 3.13.4 / 3.47.5 stable; lints from `flutter_lints` v6.
