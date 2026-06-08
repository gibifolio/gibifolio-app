import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';


import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : EntryPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : EntryPageWidget(),
        ),
        FFRoute(
          name: TitleDetailPageWidget.routeName,
          path: TitleDetailPageWidget.routePath,
          builder: (context, params) => TitleDetailPageWidget(
            titleId: params.getParam(
              'titleId',
              ParamType.String,
            ),
            fromLibrary: params.getParam(
              'fromLibrary',
              ParamType.bool,
            ),
            readingStatus: params.getParam(
              'readingStatus',
              ParamType.String,
            ),
            ownershipStatus: params.getParam(
              'ownershipStatus',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: IssueDetailPageWidget.routeName,
          path: IssueDetailPageWidget.routePath,
          builder: (context, params) => IssueDetailPageWidget(
            issueId: params.getParam(
              'issueId',
              ParamType.String,
            ),
            tittleId: params.getParam(
              'tittleId',
              ParamType.String,
            ),
            navOriginTitle: params.getParam(
              'navOriginTitle',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ListDetailPageWidget.routeName,
          path: ListDetailPageWidget.routePath,
          builder: (context, params) => ListDetailPageWidget(
            listId: params.getParam(
              'listId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LoginPageWidget.routeName,
          path: LoginPageWidget.routePath,
          builder: (context, params) => LoginPageWidget(),
        ),
        FFRoute(
          name: SearchResultsPageWidget.routeName,
          path: SearchResultsPageWidget.routePath,
          builder: (context, params) => SearchResultsPageWidget(
            searchQuery: params.getParam(
              'searchQuery',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: EntryPageWidget.routeName,
          path: EntryPageWidget.routePath,
          builder: (context, params) => EntryPageWidget(),
        ),
        FFRoute(
            name: MyListsPageWidget.routeName,
            path: MyListsPageWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(
                    initialPage: 'MyListsPage',
                    disableResizeToAvoidBottomInset: true,
                  )
                : NavBarPage(
                    initialPage: 'MyListsPage',
                    page: MyListsPageWidget(),
                    disableResizeToAvoidBottomInset: true,
                  )),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: ReleasesPageWidget.routeName,
          path: ReleasesPageWidget.routePath,
          builder: (context, params) => ReleasesPageWidget(),
        ),
        FFRoute(
          name: PublisherReleasesPageWidget.routeName,
          path: PublisherReleasesPageWidget.routePath,
          builder: (context, params) => PublisherReleasesPageWidget(
            publisherName: params.getParam(
              'publisherName',
              ParamType.String,
            ),
            publisherId: params.getParam(
              'publisherId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          requireAuth: true,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: OnboardingPageWidget.routeName,
          path: OnboardingPageWidget.routePath,
          builder: (context, params) => OnboardingPageWidget(),
        ),
        FFRoute(
            name: LibraryPageWidget.routeName,
            path: LibraryPageWidget.routePath,
            builder: (context, params) => params.isEmpty
                ? NavBarPage(
                    initialPage: 'LibraryPage',
                    disableResizeToAvoidBottomInset: true,
                  )
                : NavBarPage(
                    initialPage: 'LibraryPage',
                    page: LibraryPageWidget(),
                    disableResizeToAvoidBottomInset: true,
                  )),
        FFRoute(
          name: StatusReadPageWidget.routeName,
          path: StatusReadPageWidget.routePath,
          builder: (context, params) => StatusReadPageWidget(),
        ),
        FFRoute(
          name: StatusUnreadPageWidget.routeName,
          path: StatusUnreadPageWidget.routePath,
          builder: (context, params) => StatusUnreadPageWidget(),
        ),
        FFRoute(
          name: StatusWantedPageWidget.routeName,
          path: StatusWantedPageWidget.routePath,
          builder: (context, params) => StatusWantedPageWidget(),
        ),
        FFRoute(
          name: StatusOwnedPageWidget.routeName,
          path: StatusOwnedPageWidget.routePath,
          builder: (context, params) => StatusOwnedPageWidget(),
        ),
        FFRoute(
          name: DiscoverPageWidget.routeName,
          path: DiscoverPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(
                  initialPage: 'DiscoverPage',
                  disableResizeToAvoidBottomInset: true,
                )
              : DiscoverPageWidget(),
        ),
        FFRoute(
          name: ListsPageWidget.routeName,
          path: ListsPageWidget.routePath,
          builder: (context, params) => ListsPageWidget(
            filter: params.getParam(
              'filter',
              ParamType.String,
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: StatusReadingPageWidget.routeName,
          path: StatusReadingPageWidget.routePath,
          builder: (context, params) => StatusReadingPageWidget(),
        ),
        FFRoute(
          name: PublisherTitlesPageWidget.routeName,
          path: PublisherTitlesPageWidget.routePath,
          builder: (context, params) => PublisherTitlesPageWidget(
            publisherId: params.getParam(
              'publisherId',
              ParamType.String,
            ),
            publisherName: params.getParam(
              'publisherName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: LicensorTitlesPageWidget.routeName,
          path: LicensorTitlesPageWidget.routePath,
          builder: (context, params) => LicensorTitlesPageWidget(
            licensorId: params.getParam(
              'licensorId',
              ParamType.int,
            ),
            licensorName: params.getParam(
              'licensorName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AllBrandsPageWidget.routeName,
          path: AllBrandsPageWidget.routePath,
          builder: (context, params) => AllBrandsPageWidget(),
        ),
        FFRoute(
          name: CreatorPageWidget.routeName,
          path: CreatorPageWidget.routePath,
          builder: (context, params) => CreatorPageWidget(
            creatorId: params.getParam(
              'creatorId',
              ParamType.String,
            ),
            creatorName: params.getParam(
              'creatorName',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/entryPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Color(0xFF35E992),
                      child: Center(
                        child: Image.asset(
                          'assets/images/Artboard5_22.png',
                          width: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  name: state.name,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(
                  key: state.pageKey, name: state.name, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
