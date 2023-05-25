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
  primary: Color(0xff1d2228),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffb0b2c0),
  onPrimaryContainer: Color(0xff0f0f10),
  secondary: Color(0xffea9654),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xffe9cbab),
  onSecondaryContainer: Color(0xff13110e),
  tertiary: Color(0xfffb8122),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xffffb680),
  onTertiaryContainer: Color(0xff140f0b),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  background: Color(0xfff8f8f9),
  onBackground: Color(0xff090909),
  surface: Color(0xfff8f8f9),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffe2e2e3),
  onSurfaceVariant: Color(0xff111111),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff111111),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xff9ea2a6),
  surfaceTint: Color(0xff1d2228),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff777a7e),
  onPrimary: Color(0xfff8f8f8),
  primaryContainer: Color(0xff313c42),
  onPrimaryContainer: Color(0xffe7e9ea),
  secondary: Color(0xffefb383),
  onSecondary: Color(0xff14120e),
  secondaryContainer: Color(0xffa75f27),
  onSecondaryContainer: Color(0xfff9eee5),
  tertiary: Color(0xfffcb075),
  onTertiary: Color(0xff14110d),
  tertiaryContainer: Color(0xffd97b18),
  onTertiaryContainer: Color(0xfffff3e3),
  error: Color(0xffcf6679),
  onError: Color(0xff140c0d),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfffbe8ec),
  background: Color(0xff161616),
  onBackground: Color(0xffececec),
  surface: Color(0xff161616),
  onSurface: Color(0xffececec),
  surfaceVariant: Color(0xff393939),
  onSurfaceVariant: Color(0xffdfdfdf),
  outline: Color(0xff797979),
  outlineVariant: Color(0xff2d2d2d),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfff8f8f8),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff424344),
  surfaceTint: Color(0xff777a7e),
);
