// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:assessment/dashoard_screen.dart' as _i4;
import 'package:assessment/login_page.dart' as _i2;
import 'package:assessment/profile_screen.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const myHomePage = '/my-home-page';

  static const profileScreen = '/profile-screen';

  static const dashoardScreen = '/dashoard-screen';

  static const all = <String>{myHomePage, profileScreen, dashoardScreen};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(Routes.myHomePage, page: _i2.MyHomePage),
    _i1.RouteDef(Routes.profileScreen, page: _i3.ProfileScreen),
    _i1.RouteDef(Routes.dashoardScreen, page: _i4.DashoardScreen),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MyHomePage: (data) {
      final args = data.getArgs<MyHomePageArguments>(
        orElse: () => const MyHomePageArguments(),
      );
      return _i5.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i2.MyHomePage(key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    _i3.ProfileScreen: (data) {
      final args = data.getArgs<ProfileScreenArguments>(
        orElse: () => const ProfileScreenArguments(),
      );
      return _i5.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i3.ProfileScreen(key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
    _i4.DashoardScreen: (data) {
      final args = data.getArgs<DashoardScreenArguments>(
        orElse: () => const DashoardScreenArguments(),
      );
      return _i5.PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            _i4.DashoardScreen(key: args.key),
        settings: data,
        transitionsBuilder:
            data.transition ?? _i1.TransitionsBuilders.slideRight,
        transitionDuration: const Duration(milliseconds: 300),
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MyHomePageArguments {
  const MyHomePageArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant MyHomePageArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class ProfileScreenArguments {
  const ProfileScreenArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant ProfileScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class DashoardScreenArguments {
  const DashoardScreenArguments({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant DashoardScreenArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToMyHomePage({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.myHomePage,
      arguments: MyHomePageArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToProfileScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToDashoardScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return navigateTo<dynamic>(
      Routes.dashoardScreen,
      arguments: DashoardScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithMyHomePage({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.myHomePage,
      arguments: MyHomePageArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithProfileScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.profileScreen,
      arguments: ProfileScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> replaceWithDashoardScreen({
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
    transition,
  }) async {
    return replaceWith<dynamic>(
      Routes.dashoardScreen,
      arguments: DashoardScreenArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
