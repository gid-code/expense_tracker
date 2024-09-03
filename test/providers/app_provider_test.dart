import 'package:expense_tracker/models/auth_models.dart';
import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/models/income_item.dart';
import 'package:expense_tracker/providers/app_provider.dart';
import 'package:expense_tracker/services/apiservice.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

import 'app_provider_test.mocks.dart';

@GenerateMocks([ApiService])
void main() {
  late AppProvider appProvider;
  late MockApiService mockApiService;
  late Map<String, Object> sharedPrefsMap;
  // late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockApiService = MockApiService();
    
    sharedPrefsMap = <String, Object>{};
    
    SharedPreferencesStorePlatform.instance = FakeSharedPreferencesStore(sharedPrefsMap);
    SharedPreferences.setMockInitialValues(sharedPrefsMap);

    appProvider = AppProvider.withApiService(mockApiService);
    
  });

  group('AppProvider', () {
    test('login success', () async {
      when(mockApiService.login('test@example.com', 'password'))
          .thenAnswer((_) async => LoginResponse(accessToken: 'test_token', message: 'Success', expiresIn: '3600'));
      // when(mockSharedPreferences.setString('access_token', 'test_token'))
      //     .thenAnswer((_) async => true);
      // when(SharedPreferencesStorePlatform.instance.setValue('String','access_token', 'test_token'))
      //     .thenAnswer((_) async => true);

      await appProvider.login('test@example.com', 'password');

      expect(appProvider.token, 'test_token');
      expect(appProvider.isLoading, false);
      expect(appProvider.errorMessage, null);
    });

    test('login failure', () async {
      when(mockApiService.login('test@example.com', 'wrong_password'))
          .thenThrow(Exception('Invalid credentials'));

      await appProvider.login('test@example.com', 'wrong_password');

      expect(appProvider.token, null);
      expect(appProvider.isLoading, false);
      expect(appProvider.errorMessage, 'Exception: Invalid credentials');
    });

    test('fetchAllFinanceData success', () async {
      appProvider.setTokenForTesting('test_token');
      final incomeItems = [IncomeItem(id: '1', nameOfRevenue: 'Salary', amount: 5000)];
      final expenditureItems = [ExpenditureItem(id: '1', nameOfItem: 'Rent', estimatedAmount: 1000, category: 'Housing')];

      when(mockApiService.getIncome('test_token')).thenAnswer((_) async => incomeItems);
      when(mockApiService.getExpenditure('test_token')).thenAnswer((_) async => expenditureItems);

      await appProvider.fetchAllFinanceData();

      expect(appProvider.incomeItems, incomeItems);
      expect(appProvider.expenditureItems, expenditureItems);
      expect(appProvider.isLoading, false);
      expect(appProvider.errorMessage, null);
    });

    test('fetchAllFinanceData failure', () async {
      appProvider.setTokenForTesting('test_token');
      when(mockApiService.getIncome('test_token')).thenThrow(Exception('Network error'));

      await appProvider.fetchAllFinanceData();

      expect(appProvider.incomeItems, isEmpty);
      expect(appProvider.expenditureItems, isEmpty);
      expect(appProvider.isLoading, false);
      expect(appProvider.errorMessage, contains('Failed to fetch finance data'));
    });

    // test('setThemeMode', () async {

    //   await appProvider.setThemeMode(ThemeMode.dark);

    //   expect(appProvider.themeMode, ThemeMode.dark);
    //   expect(sharedPrefsMap['theme_mode'], 'dark');
    // });

  });

}

class FakeSharedPreferencesStore extends SharedPreferencesStorePlatform {
  FakeSharedPreferencesStore(this.values);

  final Map<String, Object> values;

  @override
  Future<bool> clear() async {
    values.clear();
    return true;
  }

  @override
  Future<Map<String, Object>> getAll() async => values;

  @override
  Future<bool> remove(String key) async {
    values.remove(key);
    return true;
  }

  @override
  Future<bool> setValue(String valueType, String key, Object value) async {
    values[key] = value;
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    return setValue('String', key, value);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return setValue('Bool', key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return setValue('Int', key, value);
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return setValue('Double', key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    return setValue('StringList', key, value);
  }
}