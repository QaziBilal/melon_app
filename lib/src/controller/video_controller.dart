import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoState extends ChangeNotifier {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  bool _isPlaying = false;

  VideoPlayerController get videoController => _videoController;

  ChewieController get chewieController => _chewieController;

  bool get isPlaying => _isPlaying;

  VideoState() {
    _videoController =
        VideoPlayerController.asset('assets/Melon_Video_background.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      aspectRatio: 0.45,
      looping: true,
      autoPlay: true, // Set autoPlay to false initially
      showControls: false,
    );
  }

  void playVideo() {
    _chewieController.play();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseVideo() {
    _chewieController.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void seekTo(Duration position) {
    _videoController.seekTo(position);
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
