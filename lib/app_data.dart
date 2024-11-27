import 'package:podcast_app/models/podcast.dart';
import 'package:podcast_app/models/user.dart';

var userData = [
  User(
      userId: 1,
      username: "Fen",
      password: "A123",
      userImg: 'assets/images/001.png'),
  User(
      userId: 2,
      username: "Mah",
      password: "S123",
      userImg: 'assets/images/001.png'),
  User(
      userId: 3,
      username: "Mon",
      password: "M123",
      userImg: 'assets/images/001.png'),
  User(
      userId: 4,
      username: "Kan",
      password: "M123",
      userImg: 'assets/images/001.png'),
];

const podcastData = [
  Podcast(
    podcastId: 1,
    podcastName: "FENGAN",
    podcastImg: "assets/images/OIP (1).jpg",
    podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
    artistId: 1,
  ),
  Podcast(
      podcastId: 2,
      podcastName: "Maharat",
      podcastImg: "assets/images/OIP (2).jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 2),
  Podcast(
      podcastId: 3,
      podcastName: "Kanabat Alsabt",
      podcastImg: "assets/images/OIP (3).jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 4),
  Podcast(
      podcastId: 4,
      podcastName: "Monset",
      podcastImg: "assets/images/OIP.jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 3),
  Podcast(
      podcastId: 5,
      podcastName: "Monset",
      podcastImg: "assets/images/OIP.jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 3),
  Podcast(
      podcastId: 6,
      podcastName: "Maharat",
      podcastImg: "assets/images/OIP (2).jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 2),
  Podcast(
      podcastId: 7,
      podcastName: "Kanabat Alsabt",
      podcastImg: "assets/images/OIP (3).jpg",
      podcastAudio: "audio/audio_2024-11-24_19-15-55.ogg",
      artistId: 4),
];
