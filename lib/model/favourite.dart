

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class FavList{

  final String? book_Name;
  final String? author;
  final String? book_image;

  FavList(
      {this.book_image,
        this.book_Name,
        this.author
      });

  factory FavList.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return FavList(
      book_image:data ['image'],
      book_Name: data['name'],
      author:data['author'] ,



    );
  }
}