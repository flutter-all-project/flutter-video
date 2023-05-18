import 'package:flutter/material.dart';
import 'package:flutter_video/utils/plugin/index.dart';

AppRouteObserver<PageRoute> routeObserver = AppRouteObserver<PageRoute>();

class AppRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  // @override
  // bool debugObservingRoute(R route) {}

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // logger.i('将要 push route: $route,previousRoute:$previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // logger.i('将要 pop route: $route,previousRoute:$previousRoute');
  }

  @override
  void unsubscribe(RouteAware routeAware) {}

  @override
  void subscribe(RouteAware routeAware, R route) {}

  // @override
  // NavigatorState get navigator {}

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    // logger.i('更新用户手势');
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    // logger.i('开始用户手势 route: $route,previousRoute:$previousRoute');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // logger.i('将要替换栈信息 newRoute: $newRoute,oldRoute:$oldRoute');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // logger.i('将要删除 route: $route,previousRoute:$previousRoute');
  }
}
