import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginScreenWidget(),
        ),
        FFRoute(
          name: 'splash_screen',
          path: '/splashScreen',
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: 'signup_screen',
          path: '/signupScreen',
          builder: (context, params) => SignupScreenWidget(),
        ),
        FFRoute(
          name: 'verification_screen',
          path: '/verificationScreen',
          builder: (context, params) => VerificationScreenWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'favoritesPage',
          path: '/favoritesPage',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'favoritesPage')
              : FavoritesPageWidget(),
        ),
        FFRoute(
          name: 'explorer_screen',
          path: '/explorerScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'explorer_screen')
              : ExplorerScreenWidget(),
        ),
        FFRoute(
          name: 'account_screen',
          path: '/accountScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'account_screen')
              : AccountScreenWidget(),
        ),
        FFRoute(
          name: 'editpicture_screen',
          path: '/editpictureScreen',
          builder: (context, params) => EditpictureScreenWidget(),
        ),
        FFRoute(
          name: 'viewall',
          path: '/viewall',
          builder: (context, params) => ViewallWidget(
            compilation: params.getParam(
              'compilation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['compilations'],
            ),
          ),
        ),
        FFRoute(
          name: 'aboutus_screen',
          path: '/aboutusScreen',
          builder: (context, params) => AboutusScreenWidget(),
        ),
        FFRoute(
          name: 'Package2',
          path: '/package2',
          builder: (context, params) => Package2Widget(),
        ),
        FFRoute(
          name: 'login_screen',
          path: '/loginScreen',
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: 'personal_info_screen',
          path: '/personalInfoScreen',
          builder: (context, params) => PersonalInfoScreenWidget(),
        ),
        FFRoute(
          name: 'package_screen',
          path: '/packageScreen',
          builder: (context, params) => PackageScreenWidget(),
        ),
        FFRoute(
          name: 'profile_screen',
          path: '/profileScreen',
          builder: (context, params) => ProfileScreenWidget(),
        ),
        FFRoute(
          name: 'Payment_screen',
          path: '/paymentScreen',
          builder: (context, params) => PaymentScreenWidget(),
        ),
        FFRoute(
          name: 'packageReceipt',
          path: '/packageReceipt',
          builder: (context, params) => PackageReceiptWidget(
            package: params.getParam(
              'package',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['packages'],
            ),
            startDate: params.getParam(
              'startDate',
              ParamType.DateTime,
            ),
            endDate: params.getParam(
              'endDate',
              ParamType.DateTime,
            ),
            pax: params.getParam(
              'pax',
              ParamType.int,
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'redirect',
          path: '/redirect',
          builder: (context, params) => RedirectWidget(
            order: params.getParam(
              'order',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'adcontext',
          path: '/adcontext',
          builder: (context, params) => AdcontextWidget(
            destination: params.getParam(
              'destination',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['destinations'],
            ),
          ),
        ),
        FFRoute(
          name: 'packagecontext',
          path: '/packagecontext',
          builder: (context, params) => PackagecontextWidget(
            package: params.getParam(
              'package',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['packages'],
            ),
            images: params.getParam<String>(
              'images',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'message',
          path: '/message',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'message')
              : MessageWidget(),
        ),
        FFRoute(
          name: 'order_screen',
          path: '/orderScreen',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'order_screen')
              : OrderScreenWidget(),
        ),
        FFRoute(
          name: 'searchbar',
          path: '/searchbar',
          builder: (context, params) => SearchbarWidget(),
        ),
        FFRoute(
          name: 'admin_screen',
          path: '/adminScreen',
          builder: (context, params) => AdminScreenWidget(),
        ),
        FFRoute(
          name: 'destinationReceipt',
          path: '/destinationReceipt',
          builder: (context, params) => DestinationReceiptWidget(
            startDate: params.getParam(
              'startDate',
              ParamType.DateTime,
            ),
            endDate: params.getParam(
              'endDate',
              ParamType.DateTime,
            ),
            pax: params.getParam(
              'pax',
              ParamType.int,
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
            destination: params.getParam(
              'destination',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['destinations'],
            ),
          ),
        ),
        FFRoute(
          name: 'orderView',
          path: '/orderView',
          builder: (context, params) => OrderViewWidget(
            order: params.getParam(
              'order',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users', 'orders'],
            ),
            country: params.getParam(
              'country',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'forgotPassword',
          path: '/forgotPassword',
          builder: (context, params) => ForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'payment_gcash',
          path: '/paymentGcash',
          builder: (context, params) => PaymentGcashWidget(),
        ),
        FFRoute(
          name: 'payment_bpi',
          path: '/paymentBpi',
          builder: (context, params) => PaymentBpiWidget(),
        ),
        FFRoute(
          name: 'payment_maya',
          path: '/paymentMaya',
          builder: (context, params) => PaymentMayaWidget(),
        ),
        FFRoute(
          name: 'payment_unionbank',
          path: '/paymentUnionbank',
          builder: (context, params) => PaymentUnionbankWidget(),
        ),
        FFRoute(
          name: 'viewall_admin',
          path: '/viewallAdmin',
          builder: (context, params) => ViewallAdminWidget(
            compilation: params.getParam(
              'compilation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['compilations'],
            ),
          ),
        ),
        FFRoute(
          name: 'account_screen_admin',
          path: '/accountScreenAdmin',
          builder: (context, params) => AccountScreenAdminWidget(),
        ),
        FFRoute(
          name: 'adcontext_admin',
          path: '/adcontextAdmin',
          builder: (context, params) => AdcontextAdminWidget(
            destination: params.getParam(
              'destination',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['destinations'],
            ),
            compilation: params.getParam(
              'compilation',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['compilations'],
            ),
          ),
        ),
        FFRoute(
          name: 'packagecontext_admin',
          path: '/packagecontextAdmin',
          builder: (context, params) => PackagecontextAdminWidget(
            package: params.getParam(
              'package',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['packages'],
            ),
            images: params.getParam<String>(
              'images',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'admin_order_screen',
          path: '/adminOrderScreen',
          builder: (context, params) => AdminOrderScreenWidget(),
        ),
        FFRoute(
          name: 'admin_orderView',
          path: '/adminOrderView',
          builder: (context, params) => AdminOrderViewWidget(
            order: params.getParam(
              'order',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users', 'orders'],
            ),
            country: params.getParam(
              'country',
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
    List<String>? collectionNamePath,
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
      collectionNamePath: collectionNamePath,
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
            return '/loginScreen';
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
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/splash.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
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
              : MaterialPage(key: state.pageKey, child: child);
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
