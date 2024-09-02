import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/models/income_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/services/apiservice.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _errorMessage;
  String? _token;
  List<IncomeItem> _incomeItems = [];
  List<ExpenditureItem> _expenditureItems = [];

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get token => _token;
  List<IncomeItem> get incomeItems => _incomeItems;
  List<ExpenditureItem> get expenditureItems => _expenditureItems;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _apiService.login(email, password);
      _token = result.accessToken;
      await _saveToken(_token!);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signup(String name, String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _apiService.signup(name, email, password);
      // After successful signup, automatically login
      await login(email, password);
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('access_token');
    notifyListeners();
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    _token = null;
    notifyListeners();
  }

  Future<void> fetchIncome() async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    print("in fetch income");
    try {
      print("in try");
      _incomeItems = await _apiService.getIncome(_token!);
      print(_incomeItems.map((e) => e.nameOfRevenue));
    } catch (e) {
      _errorMessage = 'Failed to fetch income data: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchExpenditure() async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _expenditureItems = await _apiService.getExpenditure(_token!);
    } catch (e) {
      _errorMessage = 'Failed to fetch expenditure data: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchAllFinanceData() async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      return;
    }
    print("in fetch all finance data");

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    print("after notify");
    try {
      print("in try");
      final incomesFuture = _apiService.getIncome(_token!);
      final expendituresFuture = _apiService.getExpenditure(_token!);

      final results = await Future.wait([incomesFuture, expendituresFuture]);
      
      _incomeItems = results[0] as List<IncomeItem>;
      print(_incomeItems.map((e) => e.nameOfRevenue));
      _expenditureItems = results[1] as List<ExpenditureItem>;
    } catch (e) {
      _errorMessage = 'Failed to fetch finance data: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  double get totalIncome => _incomeItems.fold(0.0, (sum, item) => sum + (item.amount ?? 0));
  double get totalExpenditure => _expenditureItems.fold(0.0, (sum, item) => sum + (item.estimatedAmount ?? 0));
  double get balance => totalIncome - totalExpenditure;

  void clearFinanceData() {
    _incomeItems = [];
    _expenditureItems = [];
    notifyListeners();
  }

  Future<void> initializeApp() async {
    await loadToken();
    if (_token != null) {
      await fetchAllFinanceData();
    }
  }

  Future<void> addIncome(String name, double amount) async {
    if (_token == null) {
      _errorMessage = 'Not authenticated';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _apiService.addIncome(_token!, name, amount);
      await fetchAllFinanceData();
    } catch (e) {
      _errorMessage = 'Failed to add income: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}