import 'package:podcast_app/models/podcast.dart';
import 'package:podcast_app/models/user.dart';

var userData = [
  User(userId: 1, username: "Abrar", password: "A123", userImg: ""),
  User(userId: 2, username: "Safa", password: "S123", userImg: ""),
  User(userId: 3, username: "Maram", password: "M123", userImg: ""),
];
const podcastData = [
  Podcast(
    podcastId: 1,
    podcastName: "podcast 1",
    podcastImg: "assets/images/1.png",
    podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
    podcastType: PodcastType.Education,
    artistId: 1,
  ),
  Podcast(
      podcastId: 2,
      podcastName: "podcast 2",
      podcastImg: "assets/images/2.jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      podcastType: PodcastType.Education,
      artistId: 1),
  Podcast(
      podcastId: 3,
      podcastName: "podcast 3",
      podcastImg: "assets/images/1.png",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      podcastType: PodcastType.Education,
      artistId: 2),
];
