import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http_interceptor/http_interceptor.dart';

class NetworkStatusInterceptor implements InterceptorContract {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw Exception('No internet connection');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({required BaseResponse response}) async {
    return response;
  }
  
  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }
  
  @override
  FutureOr<bool> shouldInterceptResponse() {
    return false;
  }


}