import 'package:flutter/material.dart';
import 'package:podcast_app/screens/playing_screen.dart';

class PodcastWidget extends StatelessWidget {
  const PodcastWidget({
    super.key,
    required this.name,
    required this.img,
    required this.id,
    required this.audio,
  });

  final String name;
  final String img;
  final int id;
  final String audio;

  void selectedPodcast(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      PlayingScreen.ScreenRoute,
      arguments: {
        'id': id,
        'name': name,
        'img': img,
        'audio': audio,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedPodcast(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
