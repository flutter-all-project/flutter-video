import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video/config/theme/theme.dart';
import 'package:flutter_video/router/index.dart';
import 'package:flutter_video/utils/system/scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 当输入和显示频率不同导致的性能下降处理
  GestureBinding.instance.resamplingEnabled = true;
  // 优化图片缓存内存
  // 在图片加载解码完成之前，无法知道到底将要消耗多少内存，容易产生大量的IO操作，导致内存峰值过高
  // 图片缓存个数 100
  PaintingBinding.instance.imageCache.maximumSize = 100;
  // 图片缓存大小 50m
  PaintingBinding.instance.imageCache.maximumSizeBytes = 50 << 20;

  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

// MaterialApp 属性详解：http://www.liujunmin.com/flutter/material_app.html#1navigatorkey
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Video 播放器',
      routerConfig: CustomRouter().routers,

      // 亮色主题
      theme: lightTheme,
      // 暗色主题
      darkTheme: darkTheme,
      // 设置日间夜间模式、或者跟随系统
      themeMode: ThemeMode.light,

      // 将物理键盘事件绑定到用户界面中的操作, 快捷键操作（按什么键执行什么操作）
      shortcuts: <ShortcutActivator, Intent>{
        ...WidgetsApp.defaultShortcuts,
        const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent()
      },

      // 统一滚动行为设置，设置后子组件将返回对应的滚动行为
      scrollBehavior: const ScrollBehaviorModified(),

      // 右上角有一个DEBUG的标识
      debugShowCheckedModeBanner: false,
      // debug 模式是否展示基线像素网格
      debugShowMaterialGrid: false,
      // 打开显示可拜访性信息的叠加层，展现组件之间的关系、占位大小
      showSemanticsDebugger: false,
      // 打开性能检测 web 不可开启,否则无法启动
      showPerformanceOverlay: false,
      // 关上栅格缓存图像的棋盘格,警告 web 不可开启,否则无法启动
      checkerboardRasterCacheImages: false,
      // 关上渲染到屏幕外位图的层的棋盘格,警告 web 不可开启,否则无法启动
      checkerboardOffscreenLayers: false,

      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(375, 812));

        return MediaQuery(
          // 处理屏幕旋转之后 ScreenUtil.init 的值及时修正
          key: ObjectKey(MediaQuery.of(context).orientation),
          // 设置文字大小不随系统设置改变（flutter screen 插件用）
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? Container(),
        );
      },
    );
  }
}
