# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Most important: this is a FlutterFlow-generated project

`Gibifolio` is built in [FlutterFlow](https://flutterflow.io). The `flutterflow` branch (the working branch) receives wholesale exports — every commit is "Updating to latest FlutterFlow output", which **overwrites nearly all of `lib/`**. Editing generated files by hand is futile: the next export silently reverts the change, and the change cannot be reflected back into the FlutterFlow project.

**Only edit files FlutterFlow preserves across exports:**
- `lib/custom_code/actions/**` — hand-written async actions (the app's real backend logic lives here).
- `lib/custom_code/widgets/**` — hand-written widgets (e.g. `comic_cover.dart`).
- `lib/flutter_flow/custom_functions.dart` — pure helper functions.

These three paths are exactly the ones excluded from the analyzer in `analysis_options.yaml` — a reliable signal of what is hand-maintained vs. generated. Everything else under `lib/` (pages, components, models, nav, schema, theme) is machine-generated; treat it as read-only and change behavior through custom code or the FlutterFlow project itself.

When asked to "fix" or "change" something in a generated page/widget, prefer implementing the logic in a custom action/function and note that the page wiring itself must be done in FlutterFlow.

## Commands

Standard Flutter tooling (stable channel, Dart SDK >=3.0.0 <4.0.0):

```bash
flutter pub get                       # install dependencies
flutter run                           # run on a connected device/emulator
flutter run -d chrome                 # run as web (web is a supported target)
flutter analyze                       # lint (uses flutter_lints; custom_code/ is excluded)
flutter test                          # run all tests
flutter test test/widget_test.dart    # run a single test file
flutter build apk | ios | web         # release builds
```

Asset/icon generation (config in `pubspec.yaml` / `flutter_native_splash.yaml`):

```bash
dart run flutter_launcher_icons       # regenerate app launcher icons
dart run flutter_native_splash:create # regenerate native splash
```

Note: `test/` contains only the default FlutterFlow smoke test (`pumpWidget(MyApp())`); there is no real test suite.

## Architecture

The app is a Brazilian-Portuguese comic-book (gibi) collection tracker. The UI language is **pt only** (`supportedLocales: [Locale('pt')]`); user-facing strings live in `lib/flutter_flow/internationalization.dart`.

### Backend: Supabase

There is no custom server. The backend is Supabase (Postgres + Auth + Storage), configured in `lib/backend/supabase/supabase.dart` (the URL and `anon` key are committed — this is the public anon key by design).

Two distinct data-access styles coexist:

1. **Generated table/row wrappers** — `lib/backend/supabase/database/tables/*.dart`. Each `*Table`/`*Row` pair mirrors a Postgres table or view. Tables prefixed `app_*` (e.g. `app_discover_feed`, `app_library_titles`, `app_title_detail`) are **read-optimized views** the UI binds to directly. Underlying mutable tables (`titles`, `issues`, `lists`, `user_issue_status`, `user_title_status`, etc.) hold the source data.
2. **RPC calls to Postgres functions** — hand-written custom actions call `Supabase.instance.client.rpc('<fn>', params: {...})` and map the JSON into structs. This is where the meaningful read/write logic lives (search, library fetches, bulk status updates, account deletion). Server functions include e.g. `search_titles`, `get_discover_brands`, `apply_title_status_to_issues`, `recalculate_title_status`, `delete_own_account`. Schema changes for these must be made in Supabase, not here.

### State management

- `FFAppState` (`lib/app_state.dart`) — a singleton `ChangeNotifier` holding global UI/session state (search results, selection mode, filters, `isAdminUser`, view toggles). A subset is persisted to `SharedPreferences` via `initializePersistedState()`. Custom actions mutate it through `FFAppState().update(() {...})`.
- `AppStateNotifier` (`lib/flutter_flow/nav/nav.dart`) — drives auth-aware routing and the splash screen.
- Per-page state uses the FlutterFlow `FlutterFlowModel` pattern (see below).

### Navigation

`go_router`, configured in `lib/flutter_flow/nav/nav.dart` via the `FFRoute` helper. Each page widget declares static `routeName`/`routePath` constants that the router references. `lib/main.dart`'s `NavBarPage` provides the 3-tab bottom navigation: **DiscoverPage** (Descubra), **LibraryPage** (Coleção), **MyListsPage** (Listas). `lib/index.dart` re-exports every page widget.

### Page / component structure (FlutterFlow convention)

Every screen and reusable component is a folder containing two files:
- `*_widget.dart` — the `StatefulWidget` (the view).
- `*_model.dart` — a `FlutterFlowModel` subclass holding controllers, child component models, and the results of backend/action calls, created via `createModel(...)`.

Top-level groupings under `lib/`:
- `auth/` — entry, login, onboarding, settings, and the Supabase auth manager (`auth/supabase_auth/`). Auth uses Supabase implicit flow with magic-link email and Sign in with Apple.
- `main_nav/` — the three nav tabs plus search and the `my_library/` status sub-pages (reading / read / unread / owned / wanted).
- `entities/` — detail pages (title, issue, list, creator, publisher titles).
- `listings/` — list/grid index pages (releases, brands, lists, licensor titles).
- `components/` — shared widgets, including a large `skeletons/` set for loading states and `bottom_sheets/` for modals.

### Shared/custom types

Custom data classes used to shuttle RPC JSON around the UI are FlutterFlow "structs" in `lib/backend/schema/structs/` (e.g. `SearchResultItemStruct`, `LibraryTitleItemStruct`). They are generated; define new ones in FlutterFlow.

## Conventions

- Mirror the surrounding generated style when adding custom code — every custom action/widget starts with the FlutterFlow import banner and `// DO NOT REMOVE OR MODIFY THE CODE ABOVE!`; keep it.
- New custom actions/widgets must be re-exported from the relevant `lib/custom_code/.../index.dart` to be callable from generated code.
- Comments and some identifiers are in Portuguese — that's expected, match it where it aids consistency.

## Rules

- **Never add AI/Claude as a git co-author or attribute commits to AI.** Do not append `Co-Authored-By: Claude ...`, `Generated with Claude Code`, or any similar AI-attribution trailer/footer to commit messages or PR descriptions. Commits are authored solely by the human developer.
- **Never commit or push without being explicitly asked.** When the user does ask, write a plain, factual commit message describing the change only.
- **Do not edit FlutterFlow-generated files** (anything under `lib/` outside the custom-code paths listed above) — changes will be overwritten on the next export. Implement logic in custom actions/functions instead.
- **Do not hardcode secrets.** The committed Supabase value is the public `anon` key only; never add service-role keys or other private credentials to the repo.
