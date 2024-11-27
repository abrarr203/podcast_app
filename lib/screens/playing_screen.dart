// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:podcast_app/constraints.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/widgets/podcast_player_widget.dart';

class PlayingScreen extends StatefulWidget {
  static const ScreenRoute = "/playing";

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  late String name;
  late int artist;
  late String imagePath;
  late String audioPath;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    name = routeArgs['name'];
    artist = routeArgs['id'];
    imagePath = routeArgs['img'];
    audioPath = routeArgs['audio'];

    return Scaffold(
      backgroundColor: iconColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: textColor,
          ),
          onTap: () => Navigator.pushNamed(context, HomeScreen.ScreenRoute),
        ),
        title: Text(
          'Now Playing',
          style: TextStyle(
              fontSize: 15.0, color: textColor, fontWeight: FontWeight.w800),
        ),
      ),
      body: PodcastPlayerWidget(
        audioPlayer: _audioPlayer,
        name: name,
        artist: artist,
        imagePath: imagePath,
        audioPath: audioPath,
      ),
    );
  }
}
