import 'dart:async';

import 'package:expense_tracker/main.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:expense_tracker/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AuthenticationInterceptor implements InterceptorContract {
  // final BuildContext context;

  // AuthenticationInterceptor(this.context);

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (request.headers.containsKey('No-Authentication')) return request;
    
    // final appProvider = Provider.of<AppProvider>(context, listen: false);
    final token = AppProvider.instance.token;

    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    if (response.statusCode == 401) {
      // Handle 401 Unauthorized response
      // final appProvider = Provider.of<AppProvider>(context, listen: false);
      // await AppProvider.instance.logout();
      // Navigate to login screen
      navigatorKey.currentState?.pushReplacementNamed('/login');
      // Navigator.of(context).pushReplacementNamed('/login');
    }

    return response;
  }
  
  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }
  
  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}