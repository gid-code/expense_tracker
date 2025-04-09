import 'package:expense_tracker/models/auth_models.dart';
import 'package:expense_tracker/models/expenditure_item.dart';
import 'package:expense_tracker/models/income_item.dart';
import 'package:expense_tracker/network/interceptors/authentication_interceptor.dart';
import 'package:expense_tracker/network/interceptors/defalut_headers_interceptor.dart';
import 'package:expense_tracker/network/interceptors/network_status_interceptor.dart';
import 'dart:convert';

import 'package:http_interceptor/http/intercepted_client.dart';

class ApiService {
  // static const String baseUrl = 'https://personal-expense-tracker.myladder.africa';
  static const String baseUrl = 'https://spendwise.up.railway.app/api';

  ApiService();

  InterceptedClient get httpClient => InterceptedClient.build(
    interceptors: [
      NetworkStatusInterceptor(),
      AuthenticationInterceptor(),
      DefalutHeadersInterceptor()
    ],
  );

  Future<LoginResponse> login(String email, String password) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'No-Authentication': '',
      },
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
    final response = await httpClient.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'No-Authentication': '',
      },
      body: jsonEncode(SignupRequest(name: name, email: email, password: password).toJson()),
    );

    if (response.statusCode == 201) {
      return SignupResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to signup: ${response.body}');
    }
  }

  Future<List<IncomeItem>> getIncome() async {
    final response = await httpClient.get(
      Uri.parse('$baseUrl/user/income'),
    );

    // print(response.body)\;
    if (response.statusCode == 200) {
      final incomeResponse = IncomeResponse.fromJson(jsonDecode(response.body));
      return incomeResponse.data ?? [];
      // final List<dynamic> jsonList = jsonDecode(response.body);
      // print(jsonList);
      // return incomeResponse.data.map((json) => IncomeItem.fromJson(json)).toList();
      
    } else {
      throw Exception('Failed to load income data');
    }
  }

  Future<List<ExpenditureItem>> getExpenditure() async {
    final response = await httpClient.get(
      Uri.parse('$baseUrl/user/expense'),
    );
    
    if (response.statusCode == 200) {
      final expenditureResponse = ExpenditureResponse.fromJson(jsonDecode(response.body));
      return expenditureResponse.data ?? [];
      // final List<dynamic> jsonList = jsonDecode(response.body);
      // print(jsonList);
      // return jsonList.map((json) => ExpenditureItem.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load expenditure data');
    }
  }

  Future<String> addIncome(String name, String amount) async {
    final response = await httpClient.post(
      Uri.parse('$baseUrl/user/income'),
      body: jsonEncode({
        'name_of_revenue': name,
        'amount': amount,
      }),
    );

    if (response.statusCode == 201) {
      return "New Income added successfully";
    } else {
      throw Exception('Failed to add income: ${response.body}');
    }
  }

  Future<void> addExpense(String name, String category, String amount) async {
    final url = Uri.parse('$baseUrl/user/expense');
    final response = await httpClient.post(
      url,
      body: json.encode({
        'name_of_expense': name,
        'category': category,
        'amount': amount,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add expense: ${response.body}');
    }
  }

  Future<UserProfile> getUserProfile() async {
    final response = await httpClient.get(
      Uri.parse('$baseUrl/user'),
    );

    // print(response.body);
    if (response.statusCode == 200) {
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user profile');
    }
  }     
}