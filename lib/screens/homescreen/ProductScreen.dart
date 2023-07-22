import 'package:book_bank/screens/chatscreen//ChatScreen.dart';
import 'package:book_bank/screens/homescreen/ProductListing.dart';
import 'package:book_bank/screens/homescreen/ProductPage2.dart';
import 'package:flutter/material.dart';
import 'package:book_bank/screens/homescreen/cart.dart';
import 'package:book_bank/screens/homescreen/favouritelist.dart';
import 'package:book_bank/screens/homescreen/homescreen2.dart';

class ProductScreen extends StatelessWidget {
  static const String id = 'ProductScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books List',style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: 'Montserrat',
        ),
        ),
        backgroundColor: Colors.purple,

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search customers',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.purpleAccent),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.swap_vert,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                if (index >= 0 && index < products.length) {
                  return ProductCard(product: products[index]);
                } else {
                  // Return an empty container or any other fallback widget if the index is invalid
                  return Container();
                }
              },
            ),
          ),
        ],
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
              onPressed: () {
                Navigator.pushNamed(context, ChatScreen.id);

              },
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, ProductListing.id);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}

class Product {
  final String imageUrl;
  final String title;
  final String summary;
  final String timestamp;
  final String? bookstate; // Make bookstate nullable
  final String? bookprice; // Make bookprice nullable

  Product({
    required this.imageUrl,
    required this.title,
    required this.summary,
    required this.timestamp,
    this.bookstate, // Add '?' to indicate it's nullable
    this.bookprice, // Add '?' to indicate it's nullable
  });
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
        side: BorderSide(color: Colors.grey), // Optional: Visible border
      ),
      child: InkWell(
        onTap: () {
          // Handle the tap on the card (Navigate to product details screen)
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8.0),
              Container(
                height: 150, // Set the height of the container to make it smaller
                width: 50, // Set the width of the container to make it smaller
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xFFf2e6ff),
                  // Use the provided color code for the 'Dashboard' text
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.4),
                      spreadRadius: 2.0,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.contain, // Use 'BoxFit.contain' to make the image fit within the container
                  ),
                ),
              ),


              SizedBox(height: 8.0),
              Text(product.title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  decoration: TextDecoration.underline,
                  fontFamily: 'Times New Roman',
                ),
              ),
              SizedBox(height: 8.0),
              Text(product.summary,style: TextStyle(
                color: Colors.purple,
                fontFamily: 'Times New Roman',
              ),),
              SizedBox(height: 15.0),
              Text("Book State: ${product.bookstate ?? 'N/A'}",style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,

                fontFamily: 'Times New Roman',
              ),),
              // Display bookstate
              SizedBox(height: 8.0),
              Text("Book Price: ${product.bookprice ?? 'N/A'}",style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontFamily: 'Times New Roman',
              ),),
              // Display bookprice
              SizedBox(height: 12.0),
              Text(product.timestamp,style: TextStyle(
                color: Colors.purpleAccent,
              ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle the primary call-to-action button (Product details)
                      Navigator.pushNamed(context, ProductPage2.id);
                    },
                    child: Text('Details',style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontFamily: 'Times New Roman',
                    ),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle the secondary call-to-action button (Add to cart)
                      Navigator.pushNamed(context, cart.id);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purpleAccent,
                      elevation: 4.0,
                      shadowColor: Colors.purple.withOpacity(0.4),
                    ),
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle the favorite icon click
                      //favouritelist
                      Navigator.pushNamed(context, favouritelist.id);
                    },
                    icon: Icon(Icons.favorite,                        color: Colors.purple,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Handle the share icon click
                    },
                    icon: Icon(Icons.share,                        color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Sample data for products
List<Product> products = [
  Product(
    imageUrl:
    'https://bukharibooks.com/wp-content/uploads/2019/07/Rich-DAD-poor-dad-250.jpg',
    title: 'Rich Dad Poor Dad',
    // Ensure the title is assigned correctly
    summary:
    "Rich Dad Poor Dad is a personal finance book written by Robert Kiyosaki. It the differences in mindset and financial education between his two fathers - his own biological father, referred to as the poor dad, and his best friend's father, referred to as the rich dad.",
    timestamp: '2023-07-20',
    bookstate: 'sell',
    // Ensure bookstate is assigned correctly
    bookprice: '\$999.9', // Ensure bookprice is assigned correctly
  ),
  // Add more products as needed


];
