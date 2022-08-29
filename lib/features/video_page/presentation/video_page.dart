import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool isEnd = false;
  bool isControl = true;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    _controller.addListener(() async {
      final duration = await _controller.position;
      if (duration?.inSeconds == _controller.value.duration.inSeconds) {
        setState(() {
          isEnd = true;
        });
      }
      if (duration?.inSeconds == 0) {
        setState(() {
          isEnd = false;
        });
      }
    });
    _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Работа с видеоплеером',
            style: TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Center(
                child: Opacity(
                  opacity: _controller.value.isPlaying && !isEnd ? 1 : 0.4,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isControl = !isControl;
                      });
                    },
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
              ),
              if (isControl)
                SizedBox(
                  child: FloatingActionButton(
                    backgroundColor: Colors.blue.shade100,
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                          isEnd = false;
                        }
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              Container(
                margin: const EdgeInsets.only(top: 200),
                child:
                    VideoProgressIndicator(_controller, allowScrubbing: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
