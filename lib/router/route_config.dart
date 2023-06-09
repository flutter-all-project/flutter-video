import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/router/page_transition.dart';
import 'package:flutter_video/router/route_name.dart';
import 'package:flutter_video/views/login/index.dart';
import 'package:flutter_video/views/main-tab/index.dart';
import 'package:flutter_video/views/splash/index.dart';
import 'package:go_router/go_router.dart';

final List<RouteBase> routes = [
  GoRoute(
    path: '/splash',
    name: Routers.splash,
    pageBuilder: fadeTransitionAnimation((context, state) => const Splash()),
  ),
  GoRoute(
    path: '/main-tab',
    name: Routers.mainTab,
    pageBuilder: slideTransitionAnimation((context, state) => const MainTab(title: '我是首页 tab')),
    routes: [
      GoRoute(
        path: 'login',
        name: Routers.login,
        pageBuilder: slideTransitionAnimation((context, state) => const LoginScreen()),
        redirect: loginRedirect, // 检测后重定向
      ),
    ],
  ),
];

FutureOr<String?> loginRedirect(BuildContext context, GoRouterState state) {
  debugPrint('loginRedirect :${state.name}');

  final loggingIn = state.name == Routers.login;

  // 如果登录状态是 false ,并且当前不在登录页面,去登录 (并将本来想要跳转的页面传递到登录页)
  if (!loggingIn) {
    // '/login?location=${state.location}';
    return state.namedLocation(Routers.login, queryParameters: {
      'location': state.location,
      'text': '未登录无法跳转到对应页面',
    });
  }

  return null;
}
