import 'dart:async';
import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';

class DefalutHeadersInterceptor implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    request.headers[HttpHeaders.acceptHeader] = 'application/json';
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