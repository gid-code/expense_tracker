// Mocks generated by Mockito 5.4.4 from annotations
// in expense_tracker/test/screens/auth/signup_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:expense_tracker/models/auth_models.dart' as _i2;
import 'package:expense_tracker/models/expenditure_item.dart' as _i10;
import 'package:expense_tracker/models/income_item.dart' as _i9;
import 'package:expense_tracker/providers/app_provider.dart' as _i8;
import 'package:flutter/material.dart' as _i4;
import 'package:go_router/src/configuration.dart' as _i3;
import 'package:go_router/src/delegate.dart' as _i5;
import 'package:go_router/src/information_provider.dart' as _i6;
import 'package:go_router/src/match.dart' as _i15;
import 'package:go_router/src/parser.dart' as _i7;
import 'package:go_router/src/router.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i14;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeUserProfile_0 extends _i1.SmartFake implements _i2.UserProfile {
  _FakeUserProfile_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRouteConfiguration_1 extends _i1.SmartFake
    implements _i3.RouteConfiguration {
  _FakeRouteConfiguration_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBackButtonDispatcher_2 extends _i1.SmartFake
    implements _i4.BackButtonDispatcher {
  _FakeBackButtonDispatcher_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouterDelegate_3 extends _i1.SmartFake
    implements _i5.GoRouterDelegate {
  _FakeGoRouterDelegate_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouteInformationProvider_4 extends _i1.SmartFake
    implements _i6.GoRouteInformationProvider {
  _FakeGoRouteInformationProvider_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGoRouteInformationParser_5 extends _i1.SmartFake
    implements _i7.GoRouteInformationParser {
  _FakeGoRouteInformationParser_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppProvider extends _i1.Mock implements _i8.AppProvider {
  MockAppProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isLoading => (super.noSuchMethod(
        Invocation.getter(#isLoading),
        returnValue: false,
      ) as bool);

  @override
  List<_i9.IncomeItem> get incomeItems => (super.noSuchMethod(
        Invocation.getter(#incomeItems),
        returnValue: <_i9.IncomeItem>[],
      ) as List<_i9.IncomeItem>);

  @override
  List<_i10.ExpenditureItem> get expenditureItems => (super.noSuchMethod(
        Invocation.getter(#expenditureItems),
        returnValue: <_i10.ExpenditureItem>[],
      ) as List<_i10.ExpenditureItem>);

  @override
  _i2.UserProfile get userProfile => (super.noSuchMethod(
        Invocation.getter(#userProfile),
        returnValue: _FakeUserProfile_0(
          this,
          Invocation.getter(#userProfile),
        ),
      ) as _i2.UserProfile);

  @override
  double get totalIncome => (super.noSuchMethod(
        Invocation.getter(#totalIncome),
        returnValue: 0.0,
      ) as double);

  @override
  double get totalExpenditure => (super.noSuchMethod(
        Invocation.getter(#totalExpenditure),
        returnValue: 0.0,
      ) as double);

  @override
  double get balance => (super.noSuchMethod(
        Invocation.getter(#balance),
        returnValue: 0.0,
      ) as double);

  @override
  _i4.ThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i4.ThemeMode.system,
      ) as _i4.ThemeMode);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void setTokenForTesting(String? token) => super.noSuchMethod(
        Invocation.method(
          #setTokenForTesting,
          [token],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<void> getUserProfile() => (super.noSuchMethod(
        Invocation.method(
          #getUserProfile,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> login(
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            email,
            password,
          ],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<bool> signup(
    String? name,
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #signup,
          [
            name,
            email,
            password,
          ],
        ),
        returnValue: _i11.Future<bool>.value(false),
      ) as _i11.Future<bool>);

  @override
  _i11.Future<void> loadToken() => (super.noSuchMethod(
        Invocation.method(
          #loadToken,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> fetchIncome() => (super.noSuchMethod(
        Invocation.method(
          #fetchIncome,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> fetchExpenditure() => (super.noSuchMethod(
        Invocation.method(
          #fetchExpenditure,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> fetchAllFinanceData() => (super.noSuchMethod(
        Invocation.method(
          #fetchAllFinanceData,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void clearFinanceData() => super.noSuchMethod(
        Invocation.method(
          #clearFinanceData,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<void> initializeApp() => (super.noSuchMethod(
        Invocation.method(
          #initializeApp,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> addIncome(
    String? name,
    double? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addIncome,
          [
            name,
            amount,
          ],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> addExpense(
    String? name,
    String? category,
    double? amount,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addExpense,
          [
            name,
            category,
            amount,
          ],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> setThemeMode(_i4.ThemeMode? mode) => (super.noSuchMethod(
        Invocation.method(
          #setThemeMode,
          [mode],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  _i11.Future<void> loadThemeMode() => (super.noSuchMethod(
        Invocation.method(
          #loadThemeMode,
          [],
        ),
        returnValue: _i11.Future<void>.value(),
        returnValueForMissingStub: _i11.Future<void>.value(),
      ) as _i11.Future<void>);

  @override
  void addListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [GoRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockGoRouter extends _i1.Mock implements _i13.GoRouter {
  MockGoRouter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.RouteConfiguration get configuration => (super.noSuchMethod(
        Invocation.getter(#configuration),
        returnValue: _FakeRouteConfiguration_1(
          this,
          Invocation.getter(#configuration),
        ),
      ) as _i3.RouteConfiguration);

  @override
  set configuration(_i3.RouteConfiguration? _configuration) =>
      super.noSuchMethod(
        Invocation.setter(
          #configuration,
          _configuration,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.BackButtonDispatcher get backButtonDispatcher => (super.noSuchMethod(
        Invocation.getter(#backButtonDispatcher),
        returnValue: _FakeBackButtonDispatcher_2(
          this,
          Invocation.getter(#backButtonDispatcher),
        ),
      ) as _i4.BackButtonDispatcher);

  @override
  _i5.GoRouterDelegate get routerDelegate => (super.noSuchMethod(
        Invocation.getter(#routerDelegate),
        returnValue: _FakeGoRouterDelegate_3(
          this,
          Invocation.getter(#routerDelegate),
        ),
      ) as _i5.GoRouterDelegate);

  @override
  set routerDelegate(_i5.GoRouterDelegate? _routerDelegate) =>
      super.noSuchMethod(
        Invocation.setter(
          #routerDelegate,
          _routerDelegate,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.GoRouteInformationProvider get routeInformationProvider =>
      (super.noSuchMethod(
        Invocation.getter(#routeInformationProvider),
        returnValue: _FakeGoRouteInformationProvider_4(
          this,
          Invocation.getter(#routeInformationProvider),
        ),
      ) as _i6.GoRouteInformationProvider);

  @override
  set routeInformationProvider(
          _i6.GoRouteInformationProvider? _routeInformationProvider) =>
      super.noSuchMethod(
        Invocation.setter(
          #routeInformationProvider,
          _routeInformationProvider,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i7.GoRouteInformationParser get routeInformationParser =>
      (super.noSuchMethod(
        Invocation.getter(#routeInformationParser),
        returnValue: _FakeGoRouteInformationParser_5(
          this,
          Invocation.getter(#routeInformationParser),
        ),
      ) as _i7.GoRouteInformationParser);

  @override
  set routeInformationParser(
          _i7.GoRouteInformationParser? _routeInformationParser) =>
      super.noSuchMethod(
        Invocation.setter(
          #routeInformationParser,
          _routeInformationParser,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get overridePlatformDefaultLocation => (super.noSuchMethod(
        Invocation.getter(#overridePlatformDefaultLocation),
        returnValue: false,
      ) as bool);

  @override
  bool canPop() => (super.noSuchMethod(
        Invocation.method(
          #canPop,
          [],
        ),
        returnValue: false,
      ) as bool);

  @override
  String namedLocation(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #namedLocation,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
          },
        ),
        returnValue: _i14.dummyValue<String>(
          this,
          Invocation.method(
            #namedLocation,
            [name],
            {
              #pathParameters: pathParameters,
              #queryParameters: queryParameters,
            },
          ),
        ),
      ) as String);

  @override
  void go(
    String? location, {
    Object? extra,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #go,
          [location],
          {#extra: extra},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void restore(_i15.RouteMatchList? matchList) => super.noSuchMethod(
        Invocation.method(
          #restore,
          [matchList],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void goNamed(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #goNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i11.Future<T?> push<T extends Object?>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #push,
          [location],
          {#extra: extra},
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> pushNamed<T extends Object?>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> pushReplacement<T extends Object?>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacement,
          [location],
          {#extra: extra},
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> pushReplacementNamed<T extends Object?>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #pushReplacementNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> replace<T>(
    String? location, {
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replace,
          [location],
          {#extra: extra},
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  _i11.Future<T?> replaceNamed<T>(
    String? name, {
    Map<String, String>? pathParameters = const {},
    Map<String, dynamic>? queryParameters = const {},
    Object? extra,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #replaceNamed,
          [name],
          {
            #pathParameters: pathParameters,
            #queryParameters: queryParameters,
            #extra: extra,
          },
        ),
        returnValue: _i11.Future<T?>.value(),
      ) as _i11.Future<T?>);

  @override
  void pop<T extends Object?>([T? result]) => super.noSuchMethod(
        Invocation.method(
          #pop,
          [result],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
