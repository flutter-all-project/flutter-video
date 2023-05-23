import 'package:flutter/material.dart';
import 'package:flutter_video/views/home/comp/wechat_picker_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController? controller;

  List<Widget> tabs = [
    const Tab(text: '推荐'),
    const Tab(text: '推荐1'),
    const Tab(text: '推荐2'),
    const Tab(text: '推荐3'),
    const Tab(text: '推荐4'),
    const Tab(text: '推荐5'),
    const Tab(text: '推荐6'),
    const Tab(text: '推荐7'),
  ];

  @override
  void initState() {
    setState(() {
      controller = TabController(length: tabs.length, vsync: this);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: TabBar(
                  controller: controller,
                  isScrollable: true, // 横向滚动
                  tabs: tabs,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0.03),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(2, 1), //x,y轴
                      color: Colors.deepPurple, //投影颜色
                      blurRadius: 20, //模糊半径
                      spreadRadius: 0.03, // 阴影距离
                    )
                  ],
                ),
                child: const Icon(Icons.menu),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          WeChatPickerScreen(),
          Text('bar2'),
          Text('bar3'),
          Text('bar4'),
          Text('bar5'),
          Text('bar6'),
          Text('bar7'),
          Text('bar8'),
        ],
      ),
    );
  }
}
