// 获取 widget 部件的元素( context , Element 对象)的尺寸
// 也可以通过 global key 给 widget上设置 key 通过 key.currentContext 获取当前 widget 的 Element
import 'package:flutter/material.dart';

getSize({BuildContext? context, GlobalKey? key}) {
  // 找到 renderObject
  // ignore: unused_local_variable
  RenderObject? renderObject = key?.currentContext?.findRenderObject();

  if (key != null) {
    return key.currentContext?.size;
  } else {
    return context?.size;
  }
}

// RenderBox继承RenderObject
getPosition({BuildContext? context, GlobalKey? key}) {
  RenderBox? renderBox;
  if (key != null) {
    renderBox = key.currentContext?.findRenderObject() as RenderBox;
  } else {
    renderBox = context?.findRenderObject() as RenderBox;
  }

  // Offset.zero坐标为0,0 代表原点
  return renderBox.localToGlobal(Offset.zero);
}

// 获取屏幕信息
// 原来是 window ，新版本修改为 View.of(context!)
getScreenInfo({BuildContext? context}) {
  return {
    'physicalSize-window': View.of(context!).physicalSize, // 屏幕尺寸
    'physicalSize-MediaQuery': MediaQuery.of(context).size, // 屏幕尺寸
    'devicePixelRatio': View.of(context).devicePixelRatio // 设备像素比
  };
}

// 获取元素尺寸
getElementSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
