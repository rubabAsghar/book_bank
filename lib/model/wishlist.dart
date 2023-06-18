import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

class WishList{

  String? book_image;
  String? book_Name;
  String? price;
  String? book_author;

  WishList(
      {this.book_image,
        this.book_Name,
        this.price,
        this.book_author});

  factory WishList.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return WishList(
      book_image:data ['image'],
      book_Name: data['name'],
      book_author:data['author'] ,
      price:data ['Price'],


    );
  }


}