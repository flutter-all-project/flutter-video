import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// transition demo:https://github.com/csells/go_router/blob/master/example/lib/transitions.dart

GoRouterPageBuilder slideTransition(Widget child) {
  return (BuildContext _, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation, // 正向的动画
          Animation<double> secondaryAnimation, // 相反的动画
          Widget child,
        ) {
          // 或者使用：animation.drive(Tween(begin: const Offset(0.25, 0), end: Offset.zero).chain(CurveTween(curve: Curves.easeIn)));
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.ease,
            reverseCurve: Curves.ease,
          );

          return SlideTransition(
            position: Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(animation),
            textDirection: TextDirection.rtl,
            child: child,
          );
        },
      );
}

GoRouterPageBuilder fadeTransition(Widget child) {
  return (_, GoRouterState state) => CustomTransitionPage(
        key: state.pageKey,
        child: child,
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
}
