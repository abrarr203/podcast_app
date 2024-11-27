import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:podcast_app/app_data.dart';
import 'package:podcast_app/constraints.dart'; // Or import colors.dart if defined elsewhere
import 'package:podcast_app/models/user.dart';

class PodcastPlayerWidget extends StatefulWidget {
  final AudioPlayer audioPlayer;
  final String name;
  final int artist;
  final String imagePath;
  final String audioPath;

  PodcastPlayerWidget({
    required this.audioPlayer,
    required this.name,
    required this.artist,
    required this.imagePath,
    required this.audioPath,
  });

  @override
  _PodcatsPlayerWidgetState createState() => _PodcatsPlayerWidgetState();
}

class _PodcatsPlayerWidgetState extends State<PodcastPlayerWidget> {
  bool isPlaying = false;
  double currentPosition = 0.0;
  double totalDuration = 1.0;
  String currentTime = '00:00';
  String totalTime = '00:00';

  String getArtistName(int artistId) {
    User artist = userData.firstWhere((user) => user.userId == artistId);
    return artist.username;
  }

  @override
  void initState() {
    super.initState();

    widget.audioPlayer.setSourceAsset(widget.audioPath).then((_) {
      widget.audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          totalDuration = duration.inMilliseconds.toDouble();
          totalTime = _formatDuration(duration);
        });
      });

      widget.audioPlayer.onPositionChanged.listen((position) {
        setState(() {
          currentPosition = position.inMilliseconds.toDouble();
          currentTime = _formatDuration(position);
        });
      });
    });

    widget.audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
  }

  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds % 60;
    return '${_twoDigits(minutes)}:${_twoDigits(seconds)}';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  void _togglePlayPause() {
    if (isPlaying) {
      widget.audioPlayer.pause();
    } else {
      widget.audioPlayer.resume();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor, // Set background color
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.0),
          topRight: Radius.circular(35.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            height: size.height * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              widget.name,
              style: TextStyle(
                  color: textColor, // Use primaryColor
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              getArtistName(widget.artist),
              style: TextStyle(
                  color: iconColor, // Use secondaryColor
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: double.infinity,
            child: LinearProgressIndicator(
              backgroundColor:
                  iconColor.withOpacity(0.3), // Slightly lightened iconColor
              value: totalDuration > 0 ? currentPosition / totalDuration : 0,
              valueColor: AlwaysStoppedAnimation(
                  textColor), // Use primaryColor for progress bar
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  currentTime,
                  style: TextStyle(
                      color: iconColor, // Use secondaryColor
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                Expanded(child: Container()),
                Text(
                  totalTime,
                  style: TextStyle(
                      color: iconColor, // Use secondaryColor
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.skip_previous,
                  color: textColor, // Use primaryColor
                  size: 0.12 * size.width,
                ),
                GestureDetector(
                  onTap: _togglePlayPause,
                  child: Icon(
                    isPlaying
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    color: textColor, // Use primaryColor
                    size: 0.18 * size.width,
                  ),
                ),
                Icon(
                  Icons.skip_next,
                  color: textColor, // Use primaryColor
                  size: 0.12 * size.width,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
