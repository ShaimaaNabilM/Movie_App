import 'package:flutter/material.dart';
import 'package:movie_app/core/themes/app_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String video;
  const CustomVideoPlayer({super.key, required this.video});

  @override
  State<CustomVideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<CustomVideoPlayer> {
  ChewieController? _ChewieController;
  late VideoPlayerController videoPlayerController;

  Future initvideo() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.video));
    await videoPlayerController.initialize();

    _ChewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initvideo();
  }

  @override
  void dispose() {
    super.dispose();
    _ChewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBlackColor,
      body: Center(
        child: _ChewieController != null
            ? AspectRatio(
                aspectRatio: 16 / 9,
                child: Chewie(controller: _ChewieController!),
              )
            : CircularProgressIndicator(
                color: AppColors.kCyanColor,
              ),
      ),
    );
  }
}
