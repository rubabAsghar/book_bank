import 'package:flutter/material.dart';

// Step 1: Define the Book class
class Book {
  final String title;
  final String customerName;
  final double price;
  final String transactionType;

  Book(this.title, this.customerName, this.price, this.transactionType);
}

// Step 2: Define the Customer class
class Customer {
  final String name;
  final int customerId;
  final List<Book> purchaseHistory;

  Customer(this.name, this.customerId, this.purchaseHistory);
}

class PurchaseHistoryScreen extends StatefulWidget {
  static const String id = 'PurchaseHistoryScreen';

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  final List<Book> allBooks = [
    Book('Book 1', 'John Doe', 10.99, 'Donated'),
    Book('Book 2', 'John Doe', 15.99, 'Purchased'),
    Book('Book 3', 'John Doe', 12.49, 'Exchanged'),
    // Add more books as needed
  ];

  final Customer customer1 = Customer(
    'John Doe',
    12345,
    [
      Book('Book 4', 'John Doe', 8.99, 'Purchased'),
      Book('Book 5', 'John Doe', 11.99, 'Donated'),
      Book('Book 6', 'John Doe', 9.49, 'Exchanged'),
      // Add more purchased books for the customer
    ],
  );

  final Customer customer2 = Customer(
    'Jane Smith',
    67890,
    [
      Book('Book 7', 'Jane Smith', 14.99, 'Donated'),
      Book('Book 8', 'Jane Smith', 9.99, 'Purchased'),
      // Add more purchased books for the customer
    ],
  );

  String _selectedTransactionType = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Purchase History', style: TextStyle(fontFamily: 'Times New Roman', color: Colors.white),),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          _buildRadioList(), // Step 4: Radio buttons to switch between lists
          Expanded(
            child: _buildBooksList(
                _selectedTransactionType), // Books according to selected transaction type
          ),
        ],
      ),
    );
  }

  // Step 4: Implement a radio button list to switch between lists
  Widget _buildRadioList() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.purple.withOpacity(0.2),
              blurRadius: 16,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            _buildRadioTile('All Books', 'All', ),
            _buildRadioTile('Donated Books', 'Donated'),
            _buildRadioTile('Purchased Books', 'Purchased'),
            _buildRadioTile('Exchanged Books', 'Exchanged'),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioTile(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RadioListTile(
        title: Text(title, style: TextStyle(fontFamily: 'Times New Roman')),
        value: value,
        groupValue: _selectedTransactionType,
        onChanged: (newValue) {
          setState(() {
            _selectedTransactionType = newValue!;
          });
        },
        activeColor: Colors.purple,
      ),
    );
  }

  // Helper method to build a list of books as a Widget
  Widget _buildBooksList(String transactionType) {
    final List<Book> allPurchaseHistory = [
      ...customer1.purchaseHistory,
      ...customer2.purchaseHistory
    ];
    final List<Book> filteredBooks = _getBooksByTransactionType(
        allPurchaseHistory, transactionType);

    return ListView.builder(
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return ListTile(
          title: Text(book.title,
              style: TextStyle(fontFamily: 'Times New Roman', fontSize: 18)),
          subtitle: Text(book.customerName,
              style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16)),
          trailing: Text(
            '${book.price.toStringAsFixed(2)}',
            style: TextStyle(fontFamily: 'Times New Roman', fontSize: 16),
          ),
          leading: Icon(Icons.book, color: Colors.purple),
        );
      },
    );
  }

  // Helper method to filter books by transaction type
  List<Book> _getBooksByTransactionType(List<Book> books,
      String transactionType) {
    if (transactionType == 'All') {
      return books;
    } else {
      return books.where((book) => book.transactionType == transactionType)
          .toList();
    }
  }
}
