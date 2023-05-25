import 'package:flutter/material.dart';
import 'package:flutter_video/views/main-tab/home.dart';
import 'package:flutter_video/views/main-tab/mine.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainTab> createState() => _HomeState();
}

class _HomeState extends State<MainTab> {
  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // backgroundColor: Theme.of(context).colorScheme.inversePrimary,

    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          // 导航条过长是否进行隐藏
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int i) {
            setState(() {
              index = i;
            });
          },
          currentIndex: index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我',
            )
          ],
        ),
        body: IndexedStack(
          index: index,
          children: const [
            Home(),
            Mine(),
          ],
        ),
      ),
      onWillPop: () async {
        return true;
      },
    );
  }
}
