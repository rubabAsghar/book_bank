// donate_now_screen.dart
import 'package:flutter/material.dart';

class DonateNowScreen extends StatelessWidget {
  static const String id = 'DonateNowScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Use the provided color code for appbar background
        elevation: 4,
        // Add elevation for the appbar
        shadowColor: Color(0xFFcc66ff),
backgroundColor: Colors.white,
        title: Text('Donate Now', style: TextStyle(
          fontFamily: 'Montserrat',

          fontWeight: FontWeight.bold,
          color: Color(
              0xFF9900CC), // Use the provided color code for the 'Dashboard' text
        ),),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Project Joined',),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProjectJoinedScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Donation History'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DonationHistoryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            // Statistics about the number of organizations that have joined the app
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.4),
                      spreadRadius: 2.0,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://getdohelp.com/img/uploads/blogs/117-e23ff8372685d59c0eb48c78efa72689.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Details about the benefits of donating books to needy people
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Benefits of Donating Books to Needy People',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Gift of Learning',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Helps Underprivileged',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Recycling Helps the Environment',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Inculcates Good Values In Those Around You',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Makes you feel happy and genuinely content',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Cleanses Your Space',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Color(
                        0xFF9900CC), // Use the provided color code for the 'Dashboard' text
                  ),
                ),
              ),
            ),

            // Statistics about the number of books donated through the app
            // Step 3: Replacing the first container with a custom progress bar
            CustomProgressBar(percentage: 75.0),
            SizedBox(height: 20.0),
            // Step 3: Replacing the second container with another custom progress bar
            CustomProgressBar(percentage: 40.0),
            // Elevated button to donate now
            ElevatedButton(
              onPressed: () {
                // Add donation functionality here
                Navigator.pushNamed(context, 'DonationScreenSteps');
              },
              child: Text('Donate Now'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        // Add navigation functionality for the bottom navigation bar here
      ),
    );
  }
}

// project_joined_screen.dart

class ProjectJoinedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Project Joined'),
      ),
      body: Center(
        child: Text('This is the Project Joined Screen'),
      ),
    );
  }
}

// donation_history_screen.dart

class DonationHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation History'),
      ),
      body: Center(
        child: Text('This is the Donation History Screen'),
      ),
    );
  }
}



class CustomProgressBar extends StatelessWidget {
  final double percentage;

  CustomProgressBar({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FractionallySizedBox(
          widthFactor: percentage / 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}