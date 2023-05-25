import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_video/router/route_name.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    // Future.delayed(const Duration(seconds: 2), () => context.push('/splash/main-tab'));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // context.pushReplacementNamed(Routers.mainTab);
      timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            // backgroundColor: Color(0xFDF9FD),
          ),
          onPressed: () => context.pushReplacementNamed(Routers.mainTab),
          child: const Text('我是 splash'),
        ),
      ),
    );
  }
}
