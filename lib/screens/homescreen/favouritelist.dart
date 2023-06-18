import 'package:flutter/material.dart';

import 'ProductListing.dart';
import 'package:book_bank/screens/homescreen/CheckoutScreen.dart';
import 'package:book_bank/screens/homescreen/DonationScreenSteps.dart';
import 'package:book_bank/screens/homescreen/ProductListing.dart';
import 'package:book_bank/screens/homescreen/ProductPage2.dart';
import 'package:book_bank/screens/homescreen/WishlistScreen.dart';
import 'package:book_bank/screens/homescreen/cart.dart';
import 'package:book_bank/screens/homescreen/homescreen2.dart';
import 'package:flutter/material.dart';
import '../../model/favourite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FavouriteList extends StatefulWidget {
  static const String id = 'favouritelist';

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  List<FavList> favourite = [];

  void _fetchFavourite() async {
    final querySnapshot = await FirebaseFirestore.instance.collection('Books')
        .get();
    List<FavList> favList = [];
    for (final document in querySnapshot.docs) {
      final book = FavList.fromSnapshot(document);
      favList.add(book);
    }
    setState(() {
       favourite= favList;
    });
  }
  @override
  void initState() {
    _fetchFavourite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar configuration
        // ...
      ),
        body:ListView.builder(
          itemCount: favourite.length,
          itemBuilder: (context, index) {


            return ListTile(
              title: Text(favourite[index].book_Name!),
              subtitle: Text(favourite[index].author!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(favourite[index].book_image!),
              ),
              // Other widget components for each favourite item
              // ...
            );
          },
         )
    );
  }
}

class favouritelist extends StatelessWidget {
  static const String id = 'favouritelist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // App bar configuration
        // ...
      ),
      body: FavouriteList(),
    );
  }
}