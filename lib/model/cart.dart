

// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {

  String? book_image;
  String? book_Name;
  String? price;
  String? quantity;

  Cart(
      {this.book_image,
        this.book_Name,
        this.price,
        this.quantity});

  factory Cart.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Cart(
      book_image:data ['Book_image'],
      book_Name: data['Book_name'],
      quantity:data['quantity'] ,
      price:data ['Price'],


    );
  }
}