import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'dart:io'; // For File
import 'package:file_picker/file_picker.dart'; // Add this import
import 'package:image_picker/image_picker.dart';
import 'package:podcast_app/screens/home_screen.dart';
import 'package:podcast_app/screens/search.dart';

class ProfileScreen extends StatefulWidget {
  @override
  static const ScreenRoute = "/profile";

  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Name'; // Initial name
  String bio = 'here is biooo'; // Initial bio
  File? _profileImageFile; // To hold the selected profile image
  File? _shareImageFile; // To hold the selected share image
  String? _selectedFilePath; // To hold the selected video/audio file path
  String _podcastName =
      'Choose Podcast'; // To hold the name of the selected podcast
  String? _sharedPodcastName; // To hold the shared podcast name
  File? _sharedImageFile; // To hold the shared image file
  List<String> _sharedPodcastNames =
      []; // List to hold names of shared podcasts
  List<File> _sharedImages = []; // List to hold shared images

  bool _isFileSelected = false; // Track if a file has been selected

  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController podcastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = name; // Initialize controller with current name
    bioController.text = bio; // Initialize controller with current bio
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    podcastNameController.dispose(); // Dispose the podcast name controller
    super.dispose();
  }

  //////////for choose image in profile
  Future<void> _pickProfileImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _profileImageFile = File(
              image.path); // Update the state with the selected profile image
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  //////////for choose image in share button
  Future<void> _pickShareImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _shareImageFile = File(
              image.path); // Update the state with the selected share image
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Stack(
        children: [
          // Main profile content
          SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _profileImageFile != null
                            ? FileImage(_profileImageFile!)
                            : NetworkImage('https://via.placeholder.com/150')
                                as ImageProvider,
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon:
                                Icon(Icons.add, size: 16, color: Colors.white),
                            padding: EdgeInsets.zero,
                            onPressed: _pickProfileImage,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    name, // Display updated name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bio, // Display updated bio
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Show the edit modal
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        width: 350,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              TextField(
                                                controller:
                                                    nameController, // Use controller for name
                                                decoration: InputDecoration(
                                                  labelText: 'Name',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              TextField(
                                                controller:
                                                    bioController, // Use controller for bio
                                                maxLines: 2,
                                                decoration: InputDecoration(
                                                  labelText: 'Bio',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // Check if the name field is empty
                                                      if (nameController
                                                          .text.isEmpty) {
                                                        // Show an alert dialog if the name is empty
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: Text(
                                                                  'You must write a name.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(); // Close the alert dialog
                                                                  },
                                                                  child: Text(
                                                                      'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        // Update the state with new values
                                                        setState(() {
                                                          name = nameController
                                                              .text;
                                                          bio = bioController
                                                              .text;
                                                        });
                                                        Navigator.of(context)
                                                            .pop(); // Close the dialog
                                                      }
                                                    },
                                                    child: Text('Save'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Edit Profile'),
                      ),
                      SizedBox(width: 10),
                      /////share dialog /////////////////////////////////////////////////////////////////////////////////////
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        width: 350,
                                        height: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // Image display
                                              Stack(
                                                alignment:
                                                    Alignment.bottomRight,
                                                children: [
                                                  Container(
                                                    width:
                                                        100, // Set the width for the square
                                                    height:
                                                        100, // Set the height for the square
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[
                                                          200], // Background color (optional)
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // No rounding for square shape
                                                      image: DecorationImage(
                                                        image: _shareImageFile !=
                                                                null
                                                            ? FileImage(
                                                                _shareImageFile!)
                                                            : NetworkImage(
                                                                'https://via.placeholder.com/150'),
                                                        fit: BoxFit
                                                            .cover, // Ensure the image covers the container
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                    height: 30,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.blue,
                                                      ),
                                                      child: IconButton(
                                                        icon: Icon(Icons.add,
                                                            size: 16,
                                                            color:
                                                                Colors.white),
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed:
                                                            _pickShareImage,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),

                                              // New text field with plus icon
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: TextField(
                                                        enabled:
                                                            false, // Make the text field non-editable
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: _podcastName
                                                                  .isNotEmpty
                                                              ? _podcastName
                                                              : 'Choose Podcast',
                                                          border:
                                                              InputBorder.none,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          10),
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        _isFileSelected
                                                            ? Icons.check
                                                            : Icons
                                                                .add, // Change icon based on selection,
                                                        color: Colors.blue,
                                                      ),
                                                      onPressed: () async {
                                                        // Show a dialog to choose between audio or video
                                                        String? fileType =
                                                            await showDialog<
                                                                String>(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Choose File Type'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            'video');
                                                                  },
                                                                  child: Text(
                                                                      'Video'),
                                                                ),
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(
                                                                            'audio');
                                                                  },
                                                                  child: Text(
                                                                      'Audio'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );

                                                        if (fileType != null) {
                                                          if (fileType ==
                                                              'video') {
                                                            // Pick a video file
                                                            final result =
                                                                await FilePicker
                                                                    .platform
                                                                    .pickFiles(
                                                              type: FileType
                                                                  .video,
                                                            );
                                                            if (result !=
                                                                null) {
                                                              setState(() {
                                                                _selectedFilePath =
                                                                    result
                                                                        .files
                                                                        .single
                                                                        .path; // Store the selected video path
                                                                _podcastName =
                                                                    result
                                                                        .files
                                                                        .single
                                                                        .name; // Update the podcast name to the file name
                                                                _isFileSelected =
                                                                    true; // Set file selected stat
                                                              });
                                                            }
                                                          } else if (fileType ==
                                                              'audio') {
                                                            // Pick an audio file
                                                            final result =
                                                                await FilePicker
                                                                    .platform
                                                                    .pickFiles(
                                                              type: FileType
                                                                  .audio,
                                                            );
                                                            if (result !=
                                                                null) {
                                                              setState(() {
                                                                _selectedFilePath =
                                                                    result
                                                                        .files
                                                                        .single
                                                                        .path; // Store the selected audio path
                                                                _podcastName =
                                                                    result
                                                                        .files
                                                                        .single
                                                                        .name; // Update the podcast name to the file name
                                                                _isFileSelected =
                                                                    true; // Set file selected state
                                                              });
                                                            }
                                                          }
                                                        }
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15),

                                              // Editable text field for name
                                              TextField(
                                                controller:
                                                    podcastNameController, // Use the podcast name controller
                                                decoration: InputDecoration(
                                                  labelText:
                                                      'Enter name of Podcast',
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              SizedBox(height: 20),

                                              // Action buttons
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      // Validation logic
                                                      if (_shareImageFile ==
                                                              null ||
                                                          podcastNameController
                                                              .text.isEmpty) {
                                                        // Show an alert dialog if any field is empty
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return AlertDialog(
                                                              title:
                                                                  Text('Error'),
                                                              content: Text(
                                                                  'Please fill in all fields.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop(); // Close the alert dialog
                                                                  },
                                                                  child: Text(
                                                                      'OK'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        // Logic to handle the "Add" action
                                                        setState(() {
                                                          _sharedPodcastNames.add(
                                                              podcastNameController
                                                                  .text); // Add the podcast name to the list
                                                          _sharedImages.add(
                                                              _shareImageFile!); // Add the selected share image to the list
                                                        });

                                                        Navigator.of(context)
                                                            .pop(); // Close the dialog
                                                      }
                                                    },
                                                    child: Text('Add'),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog when "Cancel" is pressed
                                                    },
                                                    child: Text('Cancel'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Share'),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: const Color.fromARGB(255, 104, 104, 104),
                  ),

                  // Display all shared podcasts
                  SizedBox(height: 10), // Adjusted space before the GridView
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // 3 images per row
                      childAspectRatio: 1, // Aspect ratio for square images
                      crossAxisSpacing: 10, // Space between columns
                      mainAxisSpacing: 10, // Space between rows
                    ),
                    itemCount: _sharedImages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Stack(
                            alignment: Alignment
                                .topRight, // Align the icons to the top right
                            children: [
                              Container(
                                width: 100, // Set the width of the square
                                height: 100, // Set the height of the square
                                decoration: BoxDecoration(
                                  color: Colors
                                      .grey[200], // Background color (optional)
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                  image: DecorationImage(
                                    image: FileImage(_sharedImages[
                                        index]), // Display the shared image
                                    fit: BoxFit
                                        .cover, // Cover the entire area of the square
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.play_arrow,
                                        color: Colors.green),
                                    onPressed: () {
                                      // Handle play action
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete,
                                        color:
                                            const Color.fromARGB(255, 8, 1, 0)),
                                    onPressed: () {
                                      // Remove the podcast from the lists
                                      setState(() {
                                        _sharedPodcastNames.removeAt(index);
                                        _sharedImages.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            _sharedPodcastNames[
                                index], // Display the shared podcast name
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
