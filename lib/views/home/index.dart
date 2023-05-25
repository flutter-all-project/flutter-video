import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video/views/home/comp/video_player.dart';
import 'package:flutter_video/views/home/comp/wechat_picker_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
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

  // 当页面不显示的时候也常驻在内存中,继承自 AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    setState(() {
      controller = TabController(length: tabs.length, vsync: this);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('标题'),
        centerTitle: true,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.h),
          child: Stack(
            children: [
              Expanded(
                flex: 1,
                child: TabBar(
                  controller: controller,
                  isScrollable: true, // 横向滚动
                  tabs: tabs,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 0.03.w),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 1), //x,y轴
                        color: Colors.black38, //投影颜色
                        blurRadius: 20, //模糊半径
                        spreadRadius: 0.03, // 阴影距离
                      )
                    ],
                  ),
                  child: const Icon(Icons.menu),
                ),
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          VideoPlayer(),
          WeChatPickerScreen(),
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
