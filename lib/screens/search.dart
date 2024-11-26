import 'package:flutter/material.dart';
import 'package:podcast_app/app_data.dart';
import 'package:podcast_app/models/podcast.dart';
import 'package:podcast_app/models/user.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/playing_screen.dart';
import 'package:podcast_app/screens/profile.dart';

class SearchPage extends StatefulWidget {
  static const ScreenRoute = "/search";
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  @override
  @override
  Widget build(BuildContext context) {
    // تصفية البيانات بناءً على النص المدخل
    List<User> filteredUsers = userData
        .where(
            (user) => user.username.toLowerCase().contains(query.toLowerCase()))
        .toList();

    List<Podcast> filteredPodcasts = podcastData
        .where((podcast) =>
            podcast.podcastName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Color.fromARGB(255, 147, 147, 147)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60.0),
                    borderSide: BorderSide.none),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
            SizedBox(height: 10),
            if (query.isNotEmpty) ...[
              if (filteredUsers.isNotEmpty) ...[
                Text(
                  'Users',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredUsers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 105, 105, 105)
                                .withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(filteredUsers[index].userImg),
                        ),
                        title: Text(
                          filteredUsers[index].username,
                          style:
                              TextStyle(color: Color.fromARGB(180, 66, 66, 66)),
                        ),
                        onTap: () {
                          //  Navigator.push(
                          //    context,
                          //    MaterialPageRoute(
                          //        builder: (context) => userprofile_screen(
                          //        name: filteredUsers[index]['name'],
                          //        image: filteredUsers[index]['image'],
                          //        bio: filteredUsers[index]['bio'],
                          //      ),
                          //    ),
                          //  );
                          //go to the user profile that we tap
                        },
                      ),
                    );
                  },
                ),
              ],
              if (filteredPodcasts.isNotEmpty) ...[
                SizedBox(height: 10),
                Text(
                  'Podcasts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: filteredPodcasts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5.0),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 105, 105, 105)
                                .withOpacity(0.5),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            filteredPodcasts[index].podcastImg,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          filteredPodcasts[index].podcastName,
                          style:
                              TextStyle(color: Color.fromARGB(180, 66, 66, 66)),
                        ),
                        // subtitle: Text(filteredPodcasts[index]['duration']),
                        trailing: Icon(Icons.play_arrow,
                            color: Color.fromARGB(186, 0, 0, 0)),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            PlayingScreen.ScreenRoute,
                            arguments: {
                              'name': filteredPodcasts[index].podcastName,
                              'id': filteredPodcasts[index].artistId,
                              'img': filteredPodcasts[index].podcastImg,
                              'audio': filteredPodcasts[index].podcastAudio,
                            },
                          );
                          //go to play podcast and play the taped podcast
                        },
                      ),
                    );
                  },
                ),
              ],
              if (filteredUsers.isEmpty && filteredPodcasts.isEmpty)
                Center(
                  child: Text('No results found.'),
                ),
            ],
          ],
        ),
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