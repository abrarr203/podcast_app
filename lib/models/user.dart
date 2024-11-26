import 'package:podcast_app/app_data.dart';
import 'package:podcast_app/models/podcast.dart';

class User {
  final int userId;
  final String username;
  final String password;
  final String userImg;

  List<Podcast> podcasts;

  User({
    required this.userId,
    required this.username,
    required this.password,
    required this.userImg,
  }) : podcasts = [];

  void addPodcast(Podcast pod) => podcasts.add(pod);
}
