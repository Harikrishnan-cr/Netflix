// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member, avoid_returning_null_for_void, avoid_types_as_parameter_names, no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:netflix/application/fast_laugh/fastlaugh_bloc.dart';

import 'package:netflix/core/colours/colours_netflix.dart';
import 'package:netflix/core/height/height_netflix.dart';
import 'package:netflix/core/strings/base_url.dart';
import 'package:netflix/domain/download/mode/download_model.dart';
import 'package:share_plus/share_plus.dart';

import 'package:video_player/video_player.dart';

final videUrltemp = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4'
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4'
];

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;

  final Downloads movieData;

  const VideoListItemInheritedWidget(
      {Key? key, required this.widget, required this.movieData})
      : super(key: key, child: widget);

  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class PageViewVideoListScreen extends StatelessWidget {
  final int index;
  const PageViewVideoListScreen({Key? key, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;

    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;

    final tempUrlg = videUrltemp[index % videUrltemp.length];

    log(tempUrlg);

    return Stack(
      children: [
        // Container(
        // color: Colors.accents[index],
        // ),

        FastLaughVideoPlayer(
          videoUrl:
              // tempUrlg[index],
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          onStateChanged: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(163, 0, 0, 0),
                    child: IconButton(
                        onPressed: () => null,
                        icon: const Icon(
                          Icons.volume_off_outlined,
                          color: appTextWhite,
                          size: 25,
                        ))),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$appendUrl$posterPath'),
                    ),
                    commonHeight,
                    ValueListenableBuilder(
                      valueListenable: likedVideosNotifier,
                      builder: (BuildContext context, Set<int> newLikedList,
                          Widget? _) {
                        final _index = index;
                        if (newLikedList.contains(_index)) {
                          return GestureDetector(
                            onTap: () {
                              likedVideosNotifier.value.remove(_index);
                              likedVideosNotifier.notifyListeners();
                            },
                            child: const VideoListActionPageView(
                                icon: Icons.favorite_sharp, title: 'Liked'),
                          );
                        }
                        return GestureDetector(
                          onTap: () {
                            likedVideosNotifier.value.add(_index);
                            likedVideosNotifier.notifyListeners();
                          },
                          child: const VideoListActionPageView(
                              icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                        );
                      },
                    ),
                    const VideoListActionPageView(
                        icon: Icons.add, title: 'My List'),
                    GestureDetector(
                        onTap: () {
                          log('Share pressed');
                          final movieName =
                              VideoListItemInheritedWidget.of(context)
                                  ?.movieData
                                  .posterPath;
                          if (movieName != null) {
                            Share.share(movieName);
                          }
                        },
                        child: const VideoListActionPageView(
                            icon: Icons.send, title: 'Share')),
                    const VideoListActionPageView(
                        icon: Icons.play_arrow_sharp, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoListActionPageView extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoListActionPageView(
      {Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: appTextWhite,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;

  final Function(bool isPlaying) onStateChanged;

  const FastLaughVideoPlayer(
      {Key? key, required this.videoUrl, required this.onStateChanged})
      : super(key: key);

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )

          //  VideoPlayer(_videoPlayerController)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}



//  bottom: size.height*0.01,
//           left: size.width*0.028,
//           right: 0,
