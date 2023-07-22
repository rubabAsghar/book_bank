import 'package:book_bank/screens/chatscreen/MessageListScreen.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatefulWidget {
  static const String id = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Message> messages = [
    Message(
      sender: 'John',
      content: 'Hello, how are you?',
      timestamp: '9:30 AM',
    ),
    Message(
      sender: 'Jane',
      content: 'I\'m good, thanks!',
      timestamp: '9:32 AM',
    ),
  ];

  void addMessage(String sender, String content, String timestamp) {
    Message newMessage = Message(
      sender: sender,
      content: content,
      timestamp: timestamp,
    );
    setState(() {
      messages.add(newMessage);
    });
  }

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
              colors: <Color>[
                Colors.purple,
                Colors.purpleAccent,
              ],
            ),
          ),
        ),
        title: Text('Chat'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, MessageListScreen.id);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.phone),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.purpleAccent.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.etonline.com/sites/default/files/styles/max_640x640/public/images/2023-04/Ana_de_Armas_GettyImages-1483148478_1280.jpg?h=c673cd1c&itok=K-Cv5gdm'),
                    radius: 14.0,
                  ),
                  SizedBox(width: 12.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Jane',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Online',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                final message = messages[index];
                final isSentMessage = message.sender == 'me';

                return Row(
                  mainAxisAlignment: isSentMessage
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: isSentMessage
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.purpleAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 4.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.sender ?? '',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.purple,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                message.content ?? '',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                message.timestamp ?? '',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                FloatingActionButton(
                  heroTag: 'addButton',
                  onPressed: () {
                    // Handle the add button logic here
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.purpleAccent,
                  elevation: 0,
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Type a message',
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 14.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                FloatingActionButton(
                  heroTag: 'sendButton',
                  onPressed: () {
                    addMessage(
                      'Your Name',
                      'Your Message',
                      DateTime.now().toString(),
                    );
                  },
                  child: Icon(Icons.send),
                  backgroundColor: Colors.purple,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),


    );
  }
}

class Message {
  final String? sender;
  final String? content;
  final String? timestamp;

  Message({
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}

