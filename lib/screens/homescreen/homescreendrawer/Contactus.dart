import 'package:flutter/material.dart';




class ContactUsScreen extends StatelessWidget {
  static const String id = 'ContactUsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 20.0),

            Text(
              'Contact us now to get the answers you need!',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),

            Text(
              'We will only ask relevant questions to help you find the answers you seek.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),

            Text(
              'Contact Information:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text('Email: contact@yourwebsite.com'),
            Text('Phone: +1 (123) 456-7890'),
            SizedBox(height: 20.0),

            Text(
              'Please fill out the short form below:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),

            Text(
              'Our Customer Service Team:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
              },
              child: Text('Learn More'),
            ),
            SizedBox(height: 20.0),

            Text(
              'Frequently Asked Questions:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),

            Text(
              'Connect with us on social media:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),

            Text(
              'We usually respond within 24 hours.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),

            Text(
              'Discover our brand and products:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),

            ElevatedButton(
              onPressed: () {
              },
              child: Text('More Contact Options'),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
