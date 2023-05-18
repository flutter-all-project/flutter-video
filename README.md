# flutter_video

A new Flutter project.

## go_router
```dart
// 获取当前路由名字及参数的合并值
context.namedLocation('home');

// RouteMatch
debugPrint("${GoRouter.of(context).routerDelegate.currentConfiguration}");

// 将会打印出最后一个,也就`当前子路由的位置
debugPrint(GoRouter.of(context).routerDelegate.currentConfiguration.last.matchedLocation);

// 获取当前路由的完整路径
debugPrint(GoRouter.of(context).location);
```