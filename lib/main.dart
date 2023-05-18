import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video/router/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Video 播放器',
      routerConfig: CustomRouter().routers,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        splashFactory: NoSplash.splashFactory,
        useMaterial3: true,
      ),

      // 设置日间夜间模式、或者跟随系统
      themeMode: ThemeMode.system,

      // todo 待查阅、将物理键盘事件绑定到用户界面中的操作
      shortcuts: <ShortcutActivator, Intent>{
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent()
      },

      // 右上角有一个DEBUG的标识
      debugShowCheckedModeBanner: false,
      // debug 模式是否展示基线像素网格
      debugShowMaterialGrid: false,
      // 打开显示可拜访性信息的叠加层，展现组件之间的关系、占位大小
      showSemanticsDebugger: false,
      // 打开性能检测 web 不可开启,否则无法启动
      showPerformanceOverlay: false,
      // 关上栅格缓存图像的棋盘格警告 web 不可开启,否则无法启动
      checkerboardRasterCacheImages: false,
      // 关上渲染到屏幕外位图的层的棋盘格警告 web 不可开启,否则无法启动
      checkerboardOffscreenLayers: false,
    );
  }
}
