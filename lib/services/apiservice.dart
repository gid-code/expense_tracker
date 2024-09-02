import 'package:expense_tracker/models/auth_models.dart';
import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/models/income_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://personal-expense-tracker.myladder.africa';

  Future<LoginResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(LoginRequest(email: email, password: password).toJson()),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 400) {
      throw Exception(jsonDecode(response.body)['message']);
    }else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<SignupResponse> signup(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(SignupRequest(name: name, email: email, password: password).toJson()),
    );

    if (response.statusCode == 201) {
      return SignupResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to signup: ${response.body}');
    }
  }

  Future<List<IncomeItem>> getIncome(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/income'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    // print(response.body);
    if (response.statusCode == 200) {
      final incomeResponse = IncomeResponse.fromJson(jsonDecode(response.body));
      return incomeResponse.data ?? [];
    } else {
      throw Exception('Failed to load income data');
    }
  }

  Future<List<ExpenditureItem>> getExpenditure(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/expenditure'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
    );

    
    if (response.statusCode == 200) {
      final expenditureResponse = ExpenditureResponse.fromJson(jsonDecode(response.body));
      return expenditureResponse.data ?? [];
    } else {
      throw Exception('Failed to load expenditure data');
    }
  }

  Future<String> addIncome(String accessToken, String name, double amount) async {
    final response = await http.post(
      Uri.parse('$baseUrl/user/income'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode({
        'nameOfRevenue': name,
        'amount': amount,
      }),
    );

    print(response.body);

    if (response.statusCode == 201) {
      return "New Income added successfully";
    } else {
      throw Exception('Failed to add income: ${response.body}');
    }
  }
}