import 'dart:async';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/router/route_name.dart';
import 'package:go_router/go_router.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with TickerProviderStateMixin {
  final FijkPlayer player = FijkPlayer();

  static const String url = 'https://vd3.bdstatic.com/mda-jbrihvz6iqqgk67a/sc/mda-jbrihvz6iqqgk67a.mp4';
  // static const String url = 'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';

  late AnimationController controller;
  late Animation<Offset> animation;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    player.setDataSource(url, autoPlay: false);
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.pushReplacement(Routers.splash);
        },
        child: const Text('data'),
      ),
      // child: FijkView(
      //   player: player,
      //   // panelBuilder: (FijkPlayer player, FijkData data, BuildContext context, Size viewSize, Rect texturePos) {
      //   //   return VideoUI(player: player, buildContext: context, viewSize: viewSize, texturePos: texturePos);
      //   // },
      // ),
    );
  }
}
