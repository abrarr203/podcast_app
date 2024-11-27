import 'package:flutter/material.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/profile.dart';
import 'package:podcast_app/screens/search.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}
