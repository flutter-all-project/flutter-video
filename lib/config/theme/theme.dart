// flex_color_scheme 7.1.2 flutter material3 的主题插件

// flex_color_scheme 主题切换地址 ：https://rydmike.com/flexcolorscheme/themesplayground-v7-1/#/
// theme colors 中可自定义颜色, 最左侧 copy colorscheme 复制代码

// 官方主题配置：https://m3.material.io/theme-builder#/dynamic
// 主题配置-掘金：https://juejin.cn/post/7225896523296096315#heading-1

import 'package:flutter/material.dart';

// colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// colorScheme: const ColorScheme.light().copyWith()

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent, // 手指点击时候的颜色
);

final darkTheme = ThemeData(
  colorScheme: darkColorScheme,
  useMaterial3: true,
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent, // 手指点击时候的颜色
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff000000),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff000000),
  onPrimaryContainer: Color(0xffefefef),
  secondary: Color(0xff000000),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xff000000),
  onSecondaryContainer: Color(0xffefefef),
  tertiary: Color(0xff000000),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xff000000),
  onTertiaryContainer: Color(0xffefefef),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  background: Color(0xfff8f8f8),
  onBackground: Color(0xff090909),
  surface: Color(0xfff8f8f8),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffe0e0e0),
  onSurfaceVariant: Color(0xff111111),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff101010),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xff808080),
  surfaceTint: Color(0xff000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffffffff),
  onPrimary: Color(0xff141414),
  primaryContainer: Color(0xffffffff),
  onPrimaryContainer: Color(0xff282828),
  secondary: Color(0xffffffff),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xffffffff),
  onSecondaryContainer: Color(0xff282828),
  tertiary: Color(0xffffffff),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xffffffff),
  onTertiaryContainer: Color(0xff282828),
  error: Color(0xffcf6679),
  onError: Color(0xff140c0d),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfffbe8ec),
  background: Color(0xff1d1d1d),
  onBackground: Color(0xffededed),
  surface: Color(0xff1d1d1d),
  onSurface: Color(0xffededed),
  surfaceVariant: Color(0xff464646),
  onSurfaceVariant: Color(0xffe1e1e1),
  outline: Color(0xff7a7a7a),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffffffff),
  onInverseSurface: Color(0xff141414),
  inversePrimary: Color(0xff777777),
  surfaceTint: Color(0xffffffff),
);
