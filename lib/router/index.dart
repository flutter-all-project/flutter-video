import 'package:flutter/cupertino.dart';
import 'package:flutter_video/router/route_config.dart';
import 'package:flutter_video/views/error/index.dart';
import 'package:go_router/go_router.dart';
import 'app_route_observer.dart';

//文章:https://juejin.cn/post/7153503260614393886#heading-2

class CustomRouter {
  static final _instance = CustomRouter._in();
  factory CustomRouter() => _instance;

  late final GoRouter routers = GoRouter(
    initialLocation: '/splash',
    routes: routes,
    errorBuilder: (context, state) => ErrorScreen(
      errorState: state.error,
    ),
    observers: [appRouteObserver],
    // 调试日志诊断
    debugLogDiagnostics: true,
  );

  late final RouteObserver<PageRoute> pageRouteObserver; // 页面级路由监听
  late final RouteObserver<PageRoute> appRouteObserver; // 整个应用的路由监听

  CustomRouter._in() {
    pageRouteObserver = RouteObserver<PageRoute>();
    appRouteObserver = routeObserver;
  }
}
