import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://r3---sn-p5qlsndk.googlevideo.com/videoplayback?expire=1597198736&ei=MP0yX7fzEbaKhwb1rpGwAg&ip=54.85.9.45&id=o-AGOxPJ4Iea2JXiXGQEED2OLCByG7Ry47U-CAisl6n5XF&itag=22&source=youtube&requiressl=yes&mh=aI&mm=31%2C26&mn=sn-p5qlsndk%2Csn-vgqsrnek&ms=au%2Conr&mv=u&mvi=3&pl=21&vprv=1&mime=video%2Fmp4&ratebypass=yes&dur=51.664&lmt=1597177125106520&mt=1597176955&fvip=3&fexp=23883098&c=WEB&txp=6216222&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRAIgO0jC7VDT_LNUJfOd3ChsQ4qZ42sQCNUp5_Lqa8FlbXYCIE8Ubu-ecvsd3p-5vf4O14zV4hF8fwuhDI-hPGSp7ayY&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AG3C_xAwRQIgV6ipjnMc88zwzwArD5j137CeyGKrY7LB9EJvK4lAwagCIQDbOl9gsk1-53h043PamtrYAdM5IRQg1QixVcZXQiYbSQ%3D%3D')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.initialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
