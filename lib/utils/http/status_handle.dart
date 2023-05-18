import 'package:flutter_video/utils/plugin/index.dart';

import 'http_exception.dart';

// 业务状态码情况处理
class StatusHandle {
  static final StatusHandle _instance = StatusHandle._internal();

  factory StatusHandle() => _instance;

  StatusHandle._internal();

  factory StatusHandle.code(HttpException httpException) {
    final int code = httpException.code;
    final String? msg = httpException.msg;

    toast('Http错误: 状态码:$code 错误消息: $msg');

    switch (code) {
      case 401:
      // 应该跳转登录页
      // Routers().navigateTo(CustomRoute().splash);
    }

    return _instance;
  }
}
