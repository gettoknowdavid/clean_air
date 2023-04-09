// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_air/models/air_quality.dart' as _i16;
import 'package:clean_air/ui/layout/layout_view.dart' as _i8;
import 'package:clean_air/ui/views/details/details_view.dart' as _i14;
import 'package:clean_air/ui/views/favourites/favourites_view.dart' as _i10;
import 'package:clean_air/ui/views/forgot_password/forgot_password_view.dart'
    as _i12;
import 'package:clean_air/ui/views/home/home_view.dart' as _i3;
import 'package:clean_air/ui/views/login/login_view.dart' as _i5;
import 'package:clean_air/ui/views/onboarding/onboarding_view.dart' as _i2;
import 'package:clean_air/ui/views/password_reset_confirmation/password_reset_confirmation_view.dart'
    as _i13;
import 'package:clean_air/ui/views/profile/profile_view.dart' as _i11;
import 'package:clean_air/ui/views/register/register_view.dart' as _i6;
import 'package:clean_air/ui/views/search/search_view.dart' as _i9;
import 'package:clean_air/ui/views/startup/startup_view.dart' as _i4;
import 'package:clean_air/ui/views/verification/verification_view.dart' as _i7;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i17;

class Routes {
  static const onboardingView = '/';

  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const loginView = '/login-view';

  static const registerView = '/register-view';

  static const verificationView = '/verification-view';

  static const layoutView = '/layout-view';

  static const searchView = '/search-view';

  static const favouritesView = '/favourites-view';

  static const profileView = '/profile-view';

  static const forgotPasswordView = '/forgot-password-view';

  static const passwordResetConfirmationView =
      '/password-reset-confirmation-view';

  static const detailsView = '/details-view';

  static const all = <String>{
    onboardingView,
    homeView,
    startupView,
    loginView,
    registerView,
    verificationView,
    layoutView,
    searchView,
    favouritesView,
    profileView,
    forgotPasswordView,
    passwordResetConfirmationView,
    detailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i2.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i3.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i4.StartupView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i6.RegisterView,
    ),
    _i1.RouteDef(
      Routes.verificationView,
      page: _i7.VerificationView,
    ),
    _i1.RouteDef(
      Routes.layoutView,
      page: _i8.LayoutView,
    ),
    _i1.RouteDef(
      Routes.searchView,
      page: _i9.SearchView,
    ),
    _i1.RouteDef(
      Routes.favouritesView,
      page: _i10.FavouritesView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i11.ProfileView,
    ),
    _i1.RouteDef(
      Routes.forgotPasswordView,
      page: _i12.ForgotPasswordView,
    ),
    _i1.RouteDef(
      Routes.passwordResetConfirmationView,
      page: _i13.PasswordResetConfirmationView,
    ),
    _i1.RouteDef(
      Routes.detailsView,
      page: _i14.DetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.OnboardingView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.OnboardingView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.HomeView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.HomeView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.StartupView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.StartupView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.LoginView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.LoginView(),
        settings: data,
        maintainState: false,
      );
    },
    _i6.RegisterView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.RegisterView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.VerificationView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.VerificationView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.LayoutView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.LayoutView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.SearchView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.SearchView(),
        settings: data,
        maintainState: false,
      );
    },
    _i10.FavouritesView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.FavouritesView(),
        settings: data,
        maintainState: false,
      );
    },
    _i11.ProfileView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ProfileView(),
        settings: data,
        maintainState: false,
      );
    },
    _i12.ForgotPasswordView: (data) {
      final args = data.getArgs<ForgotPasswordViewArguments>(
        orElse: () => const ForgotPasswordViewArguments(),
      );
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => _i12.ForgotPasswordView(key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i13.PasswordResetConfirmationView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.PasswordResetConfirmationView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.DetailsView: (data) {
      final args = data.getArgs<DetailsViewArguments>(nullOk: false);
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i14.DetailsView(key: args.key, airQuality: args.airQuality),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ForgotPasswordViewArguments {
  const ForgotPasswordViewArguments({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }
}

class DetailsViewArguments {
  const DetailsViewArguments({
    this.key,
    required this.airQuality,
  });

  final _i15.Key? key;

  final _i16.AirQuality airQuality;

  @override
  String toString() {
    return '{"key": "$key", "airQuality": "$airQuality"}';
  }
}

extension NavigatorStateExtension on _i17.NavigationService {
  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFavouritesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.favouritesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToForgotPasswordView({
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPasswordResetConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.passwordResetConfirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailsView({
    _i15.Key? key,
    required _i16.AirQuality airQuality,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(key: key, airQuality: airQuality),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithVerificationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.verificationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLayoutView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.layoutView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSearchView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.searchView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFavouritesView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.favouritesView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithForgotPasswordView({
    _i15.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.forgotPasswordView,
        arguments: ForgotPasswordViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPasswordResetConfirmationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.passwordResetConfirmationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailsView({
    _i15.Key? key,
    required _i16.AirQuality airQuality,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailsView,
        arguments: DetailsViewArguments(key: key, airQuality: airQuality),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
