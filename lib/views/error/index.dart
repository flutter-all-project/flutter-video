import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({Key? key, required this.errorState}) : super(key: key);

  final Exception? errorState;

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
    return Placeholder(
      child: Column(
        children: [const Text('我是404'), Text("错误原因：${widget.errorState}")],
      ),
    );
  }
}
