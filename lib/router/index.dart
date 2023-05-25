import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_video/router/page_transition.dart';
import 'package:flutter_video/router/route_config.dart';
import 'package:flutter_video/views/error/index.dart';
import 'package:go_router/go_router.dart';
import 'app_route_observer.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

// 文章:https://juejin.cn/post/7153503260614393886#heading-2
// 全：https://juejin.cn/post/7047035390003249189#heading-30

class AppRouter {
  static final _instance = AppRouter._in();
  factory AppRouter() => _instance;

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  final GoRouter routers = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: routes,
    errorPageBuilder: slideTransitionAnimation((context, state) => ErrorScreen(errState: state)),
    observers: [
      // 整个应用的路由监听
      routeObserver,
      // 页面级路由监听
      RouteObserver<PageRoute>(),
    ],
    // 调试日志诊断
    debugLogDiagnostics: true,
  );

  AppRouter._in() {
    // 在 WEB 的 URL 中关闭 #
    if (kIsWeb) {
      usePathUrlStrategy();
    }
  }
}
