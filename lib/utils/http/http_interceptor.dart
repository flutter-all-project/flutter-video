import 'package:flutter_video/utils/http/status_handle.dart';
import 'http_exception.dart';
import 'package:dio/dio.dart';

// 自定义拦截器
class HttpInterceptor extends Interceptor {
  // 请求拦截
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    super.onRequest(options, handler);
  }

  // 响应拦截
  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    // do something...
    super.onResponse(response, handler);
  }

  // 异常拦截
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // 覆盖异常为自定义的异常类
    HttpException httpException = HttpException.create(err);
    StatusHandle.code(httpException);

    final newErr = DioError(
      requestOptions: err.requestOptions,
      error: err.error,
      response: err.response,
      type: err.type,
      stackTrace: err.stackTrace,
      message: err.message,
    );

    super.onError(newErr, handler);
  }
}
