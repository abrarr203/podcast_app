class Podcast {
  final int podcastId;
  final String podcastName;
  final String podcastImg;
  final String podcastAudio;
  final int artistId;

  const Podcast(
      {required this.podcastId,
      required this.podcastName,
      required this.podcastImg,
      required this.podcastAudio,
      required this.artistId});
}
