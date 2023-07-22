import 'package:book_bank/screens/homescreen/homescreendrawer/Customers.dart';
import 'package:book_bank/screens/homescreen/homescreen2.dart';
import 'package:flutter/material.dart';




import 'ChatScreen.dart';

class MessageListScreen extends StatelessWidget {
  static const String id = 'MessageListScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[Colors.purple, Colors.purpleAccent],
            ),
          ),
        ),
        title: Row(
          children: [

            SizedBox(width: 8.0),
            Text('Chats'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchScreen.id);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with your actual message count
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              // Handle swipe dismissal here
            },
            child: MessageItem(
              username: 'John Doe',
              message: 'Hello, how are you?',
              time: '12:34 PM',
              numberofmessgaes: '02',
              isOnline: true,
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purpleAccent,
        selectedItemColor: Color(0xFFffffff),
        unselectedItemColor: Colors.purple,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, homescreen2.id);
          } else if (index == 1) {
            Navigator.pushNamed(context, CustomerDetailsScreen.id);
          } else if (index == 2) {
            Navigator.pushNamed(context, SettingsScreen.id);
          }
        },
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final String numberofmessgaes;
  final bool isOnline;

  MessageItem({
    required this.username,
    required this.message,
    required this.time,
    required this.numberofmessgaes,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          // Handle swipe dismissal here
        },
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, ChatScreen.id);
            // Add your button logic here
          },
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFffffff),
            onPrimary: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            elevation: 4.0,
            shadowColor: Colors.purpleAccent.withOpacity(0.8),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/3/34/Elon_Musk_Royal_Society_%28crop2%29.jpg'),
                    radius: 25.0,
                  ),
                  if (isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.deepPurpleAccent,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CircleAvatar(
                              radius: 12.0,
                              backgroundColor: Colors.red,
                              child: Text(
                                numberofmessgaes.toString(),
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  static const String id = 'SearchScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      // Add your search screen UI here
    );
  }
}



class SettingsScreen extends StatelessWidget {
  static const String id = 'SettingsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        shadowColor: Colors.purpleAccent,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.purple,
                      Colors.purpleAccent,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purpleAccent.withOpacity(0.4),
                      blurRadius: 8.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Chat Settings',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Customize your chat experience',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.call, color: Colors.purple),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Incoming Call Sounds',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Spacer(),
                  ToggleButton(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.volume_up, color: Colors.purple),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Message Sounds',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Spacer(),
                  ToggleButton(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.message, color: Colors.purple),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Pop-up New Messages',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Spacer(),
                  ToggleButton(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.visibility, color: Colors.purple),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Active Status',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Spacer(),
                  ToggleButton(),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}


class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _value,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

class MessageRequestsScreen extends StatelessWidget {
  static const String id = 'MessageRequestsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Requests'),
      ),
      // Add your message requests screen UI here
    );
  }
}

class ArchivedChatsScreen extends StatelessWidget {
  static const String id = 'ArchivedChatsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived Chats'),
      ),
      // Add your archived chats screen UI here
    );
  }
}


