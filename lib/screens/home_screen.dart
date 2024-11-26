import 'package:flutter/material.dart';
import 'package:podcast_app/app_data.dart';
import 'package:podcast_app/screens/profile.dart';
import 'package:podcast_app/screens/search.dart';
import 'package:podcast_app/widgets/podcast_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const ScreenRoute = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: podcastData
            .map((podcastData) => PodcastWidget(
                  name: podcastData.podcastName,
                  img: podcastData.podcastImg,
                  id: podcastData.artistId,
                  audio: podcastData.podcastAudio,
                ))
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            // Check if the Search icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen()), // Replace with your Search page widget
            );
          }
          if (index == 1) {
            // Check if the Search icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SearchPage()), // Replace with your Search page widget
            );
          }
          if (index == 2) {
            // Check if the Search icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileScreen()), // Replace with your Search page widget
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
