import 'package:dio/dio.dart';

// 自定义 http 异常
class HttpException implements Exception {
  final int code;
  final String? msg;

  HttpException({this.code = 500, this.msg = '未知异常，请联系管理员'});

  // 重写报错的tostring
  @override
  String toString() {
    return "\r\n\tHttp错误: \r\n\t\t状态码:$code \r\n\t\t错误消息: $msg";
  }

  factory HttpException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return HttpException(code: -1, msg: '请求取消');
      case DioErrorType.connectionTimeout:
        return HttpException(code: -1, msg: '连接超时');
      case DioErrorType.sendTimeout:
        return HttpException(code: -1, msg: '请求超时');
      case DioErrorType.receiveTimeout:
        return HttpException(code: -1, msg: '响应超时');
      case DioErrorType.badResponse:
        // 服务器异常
        int statusCode = error.response?.statusCode ?? 0;

        switch (statusCode) {
          case 0:
            return HttpException(code: statusCode, msg: 'response 或者 状态码为空,如果是web项目可能跨域');
          case 400:
            return HttpException(code: statusCode, msg: '请求语法错误');
          case 401:
            return HttpException(code: statusCode, msg: '没有权限');
          case 403:
            return HttpException(code: statusCode, msg: '服务器拒绝执行');
          case 404:
            return HttpException(code: statusCode, msg: '找不到地址');
          case 405:
            return HttpException(code: statusCode, msg: '该请求方法被禁止');
          case 500:
            return HttpException(code: statusCode, msg: '服务器内部错误');
          case 502:
            return HttpException(code: statusCode, msg: '无效的请求');
          case 503:
            return HttpException(code: statusCode, msg: '服务器挂了');
          case 505:
            return HttpException(code: statusCode, msg: '不支持HTTP协议请求');
          default:
            return HttpException(code: statusCode, msg: error.response?.statusMessage ?? '');
        }
      default:
        return HttpException(code: -1, msg: error.message);
    }
  }
}
