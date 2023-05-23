import 'dart:async';
import 'dart:math';

import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';

class VideoUI extends StatefulWidget {
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;

  const VideoUI({
    super.key,
    required this.player,
    required this.buildContext,
    required this.viewSize,
    required this.texturePos,
  });

  @override
  VideoUIState createState() => VideoUIState();
}

class VideoUIState extends State<VideoUI> with SingleTickerProviderStateMixin {
  FijkPlayer get player => widget.player;

  // 是否播放
  bool _playing = false;

  // 播放速度
  double speed = 1;

  // 播放器时间
  Duration _currentPos = const Duration(milliseconds: 0);
  late StreamSubscription _posSub;

  // 是否数据不足播放出现卡顿，正在缓冲中。
  bool isBuffering = false;
  late StreamSubscription _bufferSub;

  late AnimationController _menuController;
  late Animation<double> _animationTop;
  late Animation<double> _animationBottom;
  late CurvedAnimation _animationCenter;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    videoInit();
    menuAnimationInit();

    timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      _menuController.forward();
      timer.cancel();
    });
  }

  @override
  void dispose() {
    player.removeListener(_playerValueChanged);
    _posSub.cancel();
    _bufferSub.cancel();

    _menuController.removeListener(_menuControllerAddListener);
    timer.cancel();

    super.dispose();
  }

  videoInit() {
    widget.player.addListener(_playerValueChanged);
    _currentPos = widget.player.currentPos;
    _posSub = widget.player.onCurrentPosUpdate.listen(onCurrentPosUpdate);
    _bufferSub = widget.player.onBufferStateUpdate.listen(onBufferStateUpdate);
  }

  void menuAnimationInit() {
    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _menuController.addListener(_menuControllerAddListener);

    final topTween = Tween<double>(begin: 10.0, end: -200.0);
    final bottomTween = Tween<double>(begin: 0.0, end: -200.0);
    _animationTop = topTween.chain(CurveTween(curve: Curves.ease)).animate(_menuController);
    _animationBottom = bottomTween.chain(CurveTween(curve: Curves.ease)).animate(_menuController);
    _animationCenter = CurvedAnimation(reverseCurve: Curves.ease, parent: _menuController, curve: Curves.ease);
  }

  _menuControllerAddListener() {
    setState(() {});
  }

  void _playerValueChanged() {
    bool playing = (player.value.state == FijkState.started);

    if (playing != _playing) {
      setState(() {
        _playing = playing;
      });
    }
  }

  void onCurrentPosUpdate(v) {
    setState(() {
      _currentPos = v;
    });
  }

  void onBufferStateUpdate(v) {
    setState(() {
      isBuffering = v;
    });
  }

  String formatDuration(Duration duration) {
    String hours = duration.inHours.toString().padLeft(0, '2');
    String minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    String seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "${duration.inHours != 0 ? '$hours:' : ''}$minutes:$seconds";
  }

  Widget topUI() {
    return Positioned(
      top: _animationTop.value,
      left: 0,
      right: 0,
      child: Row(
        children: [
          player.value.fullScreen ? const SizedBox(width: 30) : Container(),
          player.value.fullScreen
              ? Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (player.value.fullScreen) {
                          player.exitFullScreen();
                        } else {}
                      },
                    )
                  ],
                )
              : Container(),
          const Spacer(),
          const Expanded(
            flex: 30,
            child: Text(
              '我是标题',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget centerUI() {
    return Positioned(
      child: Listener(
        onPointerDown: (e) {
          if (_menuController.status == AnimationStatus.completed) {
            _menuController.reverse();
          }

          if (_menuController.status == AnimationStatus.dismissed) {
            _menuController.forward();
          }
        },
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: FadeTransition(
              opacity: _animationCenter,
              child: IconButton(
                iconSize: 80,
                icon: Icon(
                  _playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  _playing ? widget.player.pause() : widget.player.start();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomUI() {
    return Positioned(
      bottom: _animationBottom.value,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                formatDuration(_currentPos),
                style: const TextStyle(color: Colors.white),
              ),
              const Text(
                '/',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                formatDuration(player.value.duration),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          player.value.duration.inMilliseconds > 0
              ? Slider(
                  min: 0,
                  max: player.value.duration.inMilliseconds.toDouble(),
                  activeColor: Colors.white,
                  inactiveColor: Colors.black12,
                  onChanged: (value) {
                    setState(() {
                      _currentPos = Duration(milliseconds: value.toInt());
                    });
                  },
                  onChangeEnd: (value) {
                    player.seekTo(value.toInt());
                  },
                  value: _currentPos.inMilliseconds.toDouble(),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  _playing ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
                onPressed: () {
                  _playing ? widget.player.pause() : widget.player.start();
                },
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    if (speed > 3) {
                      speed = 1;
                    } else {
                      speed += 0.5;
                    }
                  });

                  await player.setSpeed(speed);
                },
                child: Text('$speed'),
              ),
              IconButton(
                icon: Icon(
                  player.value.fullScreen ? Icons.fullscreen_exit : Icons.fullscreen,
                  color: Colors.white,
                ),
                onPressed: () {
                  !player.value.fullScreen ? player.enterFullScreen() : player.exitFullScreen();
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Rect rect = Rect.fromLTRB(
      max(0.0, widget.texturePos.left),
      max(0.0, widget.texturePos.top),
      min(widget.viewSize.width, widget.texturePos.right),
      min(widget.viewSize.height, widget.texturePos.bottom),
    );

    return Positioned.fromRect(
      rect: rect,
      child: Stack(
        children: [topUI(), centerUI(), bottomUI()],
      ),
    );
  }
}
