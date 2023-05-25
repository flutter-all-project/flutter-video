// flex_color_scheme 7.1.2 flutter material3 的主题插件

// 官方主题配置：https://m3.material.io/theme-builder#/dynamic
// flex_color_scheme 主题切换地址 （theme colors 中可自定义颜色）：https://rydmike.com/flexcolorscheme/themesplayground-v7-1/#/
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
  primary: Color(0xFF466800), // 按钮文字颜色
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFB9F552),
  onPrimaryContainer: Color(0xFF121F00),
  secondary: Color(0xFF466800),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFB9F552),
  onSecondaryContainer: Color(0xFF121F00),
  tertiary: Color(0xFF466800),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFB9F552),
  onTertiaryContainer: Color(0xFF121F00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFEFCF4),
  onBackground: Color(0xFF1B1C18),
  surface: Color(0xFFFEFCF4),
  onSurface: Color(0xFF1B1C18),
  surfaceVariant: Color(0xFFE1E4D4),
  onSurfaceVariant: Color(0xFF45483D),
  outline: Color(0xFF75786C),
  onInverseSurface: Color(0xFFF2F1E9),
  inverseSurface: Color(0xFF30312C),
  inversePrimary: Color(0xFF9ED837),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF466800),
  outlineVariant: Color(0xFFC5C8B9),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF9ED837),
  onPrimary: Color(0xFF233600),
  primaryContainer: Color(0xFF344E00),
  onPrimaryContainer: Color(0xFFB9F552),
  secondary: Color(0xFF9ED837),
  onSecondary: Color(0xFF233600),
  secondaryContainer: Color(0xFF344E00),
  onSecondaryContainer: Color(0xFFB9F552),
  tertiary: Color(0xFF9ED837),
  onTertiary: Color(0xFF233600),
  tertiaryContainer: Color(0xFF344E00),
  onTertiaryContainer: Color(0xFFB9F552),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1C18),
  onBackground: Color(0xFFE4E3DB),
  surface: Color(0xFF1B1C18),
  onSurface: Color(0xFFE4E3DB),
  surfaceVariant: Color(0xFF45483D),
  onSurfaceVariant: Color(0xFFC5C8B9),
  outline: Color(0xFF8F9285),
  onInverseSurface: Color(0xFF1B1C18),
  inverseSurface: Color(0xFFE4E3DB),
  inversePrimary: Color(0xFF466800),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF9ED837),
  outlineVariant: Color(0xFF45483D),
  scrim: Color(0xFF000000),
);
