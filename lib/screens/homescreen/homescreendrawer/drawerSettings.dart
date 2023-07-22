import 'package:flutter/material.dart';
import 'package:book_bank/screens/homescreen/homescreen2.dart';
import 'package:book_bank/screens/homescreen/favouritelist.dart';
import 'package:book_bank/screens/homescreen/cart.dart';

class drawerSettings extends StatelessWidget {
  static const String id = 'drawerSettings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle resetting settings to default
            },
          ),
        ],
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Color(0xFFffffff), Color(0xFFffe6ff), Color(0xFFffffff),Color(0xFFffffff), Color(0xFFffe6ff), Color(0xFFffffff)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.4),
                  spreadRadius: 2.0,
                  blurRadius: 3.0,
                  offset: Offset(0, 2),
                ),
              ],

            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.4),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],

                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'General Details',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Update your photos and personal details here',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 13.0,
                  ),
                ),
                SizedBox(height: 22.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.2),
                        spreadRadius: 2.0,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Information',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: Colors.purple),
                            labelText: 'Enter first name',
                            labelStyle: TextStyle(
                              color: Color(0xFFff99ff),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: Colors.purple),
                            labelText: 'Enter last name',
                            labelStyle: TextStyle(
                              color: Color(0xFFff99ff),
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Email Address',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email, color: Colors.purple),
                            labelText: 'xyz@gmail.com',
                            suffixIcon: Icon(Icons.check, color: Colors.purple),
                            labelStyle: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'Username',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.person, color: Colors.purple),
                            labelText: 'ABC123',
                            suffixIcon: Icon(Icons.check, color: Colors.purple),
                            labelStyle: TextStyle(
                              color: Colors.purpleAccent,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(
                            'BIO',
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SingleChildScrollView(
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              value: 'Font',
                              onChanged: (newValue) {
                                // Handle dropdown value change
                              },
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'Font',
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 3.0,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                    child: Text(
                                      'Choose Fonts',
                                      style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.deepPurple,
                              ),
                              elevation: 8,
                              underline: Container(),
                            ),
                            SizedBox(width: 1.0),
                            IconButton(icon: Icon(Icons.format_bold, color: Colors.deepPurple, size: 20,), onPressed: () {}),
                            IconButton(icon: Icon(Icons.format_italic, color: Colors.deepPurple,size: 20,), onPressed: () {}),
                            IconButton(icon: Icon(Icons.format_underline, color: Colors.deepPurple,size: 20,), onPressed: () {}),

                          ],
                        ),
                      ),


                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 3.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                          border: Border.all(color: Colors.purple),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Write a short introduction',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(30.0),
                              hintStyle: TextStyle(
                                color: Colors.purple,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Timezone',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.purple.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: DropdownButton<String>(
                                  value: 'Timezone',
                                  onChanged: (newValue) {
                                    // Handle dropdown value change
                                  },
                                  items: [
                                    DropdownMenuItem<String>(
                                      value: 'Timezone',
                                      child: Text(
                                        'Timezone',
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ),
                                  ],
                                  underline: SizedBox(), // Remove the underline
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          CircleAvatar(
                            backgroundColor: Colors.deepPurple,
                            child: Icon(Icons.access_time, color: Colors.white),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage('https://images.mubicdn.net/images/cast_member/2184/cache-2992-1547409411/image-w856.jpg'),
                        ),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit your photo',
                              style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              children: [
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                    ],
                  ),
                ),


                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Icon(Icons.cloud_upload, color: Colors.purple, size: 24.0),
                        SizedBox(height: 18.0),
                        Text(
                          'Click to upload',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 12.0,

                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'or drag and drop',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'SVG, PNG, JPEG, JPG, or GIF',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          '(max. 800x400px)',
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Google Location',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        height: 200.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage('https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/media/image/2023/02/google-maps-2961754.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.purple.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: 16.0,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Icon(Icons.search, color: Colors.purple),
                            SizedBox(width: 8.0),
                            Icon(Icons.directions, color: Colors.purple),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'House Number',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Block Number',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Area Name',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'City Name',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Province Name',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Country Name',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.0),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Handle cancel button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 4.0,
                          shadowColor: Colors.purple,
                        ),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle save button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                          onPrimary: Colors.white,
                          elevation: 4.0,
                          shadowColor: Colors.purple,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),






                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, homescreen2.id);

              },
            ),
            IconButton(
              icon: Icon(
                Icons.chat,
                color: Colors.purple,
              ),
              onPressed: () {},
            ),
            SizedBox(width: 32),
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, cart.id);

              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.purple,
              ),
              onPressed: () {
                Navigator.pushNamed(context, favouritelist.id);

              },
            ),
          ],
        ),
      ),


    );
  }
}
