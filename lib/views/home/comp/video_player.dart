import 'dart:async';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video/components/fijkplayer/fijkplayer_ui.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> with TickerProviderStateMixin {
  final FijkPlayer player = FijkPlayer();

  late AnimationController controller;
  late Animation<Offset> animation;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    player.setDataSource("https://vd3.bdstatic.com/mda-jbrihvz6iqqgk67a/sc/mda-jbrihvz6iqqgk67a.mp4", autoPlay: false);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FijkView(
        player: player,
        panelBuilder: (FijkPlayer player, FijkData data, BuildContext context, Size viewSize, Rect texturePos) {
          return VideoUI(player: player, buildContext: context, viewSize: viewSize, texturePos: texturePos);
        },
      ),
    );
  }
}
