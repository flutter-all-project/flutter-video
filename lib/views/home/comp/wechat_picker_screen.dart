import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class WeChatPickerScreen extends StatefulWidget {
  const WeChatPickerScreen({super.key});

  @override
  State<WeChatPickerScreen> createState() => _WeChatPickerScreenState();
}

class _WeChatPickerScreenState extends State<WeChatPickerScreen> {
  @override
  void initState() {
    super.initState();
  }

  void openSource() async {
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: const AssetPickerConfig(
        textDelegate: AssetPickerTextDelegate(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [TextButton(onPressed: openSource, child: const Text("打开资源"))],
        )
      ],
    );
  }
}
