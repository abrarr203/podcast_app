import 'package:flutter/material.dart';
import 'package:podcast_app/app_data.dart';
import 'package:podcast_app/constraints.dart';
import 'package:podcast_app/widgets/podcast_widget.dart';
import 'package:podcast_app/screens/search.dart';
import 'package:podcast_app/screens/profile.dart';

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
        backgroundColor: backgroundColor, // Use the background color constant
        elevation: 0,
      ),
      backgroundColor: backgroundColor, // Use the background color constant
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              const SizedBox(height: 20),
              _buildSectionTitle('Recently Played'),
              _buildHorizontalList(),
              const SizedBox(height: 20),
              _buildSectionTitle('Popular Podcasts'),
              _buildPodcastGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, HomeScreen.ScreenRoute);
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  // Header Section
  Widget _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hey, User!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor, // Use the text color constant
            ),
          ),
          CircleAvatar(
            radius: 24,
            backgroundColor: iconColor, // Use the icon color constant
            child: Icon(
              Icons.account_circle_outlined,
              size: 32,
              color: textColor, // Use the text color constant
            ),
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor, // Use the text color constant
        ),
      ),
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 120, // Height for rectangular items
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: podcastData.length > 5 ? 5 : podcastData.length,
        separatorBuilder: (context, index) =>
            const SizedBox(width: 12), // Space between items
        itemBuilder: (context, index) {
          final podcast = podcastData[index];
          return PodcastWidget(
            name: podcast.podcastName,
            img: podcast.podcastImg,
            id: podcast.artistId,
            audio: podcast.podcastAudio,
          );
        },
      ),
    );
  }

  // Popular Podcasts Grid
  Widget _buildPodcastGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 2 - 20,
          childAspectRatio: 1.0, // This will make the grid items square
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: podcastData.length,
        itemBuilder: (context, index) {
          final podcast = podcastData[index];
          return PodcastWidget(
            name: podcast.podcastName,
            img: podcast.podcastImg,
            id: podcast.artistId,
            audio: podcast.podcastAudio,
          );
        },
      ),
    );
  }
}
