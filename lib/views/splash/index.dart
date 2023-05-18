import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_video/router/route-name.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000), () => context.replace('/main-tab'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("我是 splash"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              // backgroundColor: Color(0xFDF9FD),
            ),
            onPressed: () {
              context.replaceNamed(homeTab);
            },
            child: const Text('我是 splash'),
          ),
        ],
      ),
    );
  }
}
