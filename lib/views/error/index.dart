import 'package:flutter/material.dart';
import 'package:flutter_video/router/route_name.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key, required this.errState}) : super(key: key);

  final GoRouterState errState;

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = GoRouter.of(context).routerDelegate.currentConfiguration;

    return Scaffold(
      appBar: AppBar(
          title: const Text('404'),
          leading: IconButton(
            onPressed: () {
              context.replaceNamed(Routers.splash);
            },
            icon: const Icon(Icons.arrow_back_ios),
          )),
      body: Column(
        children: [Text("错误原因：${config.error}")],
      ),
    );
  }
}
