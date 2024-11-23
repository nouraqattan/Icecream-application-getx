import 'package:flutter/material.dart';

class iceCreamDetailPage extends StatelessWidget {
  final String iceCreamFlavor;
  final String imageAsset;
  final String description;
  final double rating;

  iceCreamDetailPage({
    required this.iceCreamFlavor,
    required this.imageAsset,
    required this.description,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$iceCreamFlavor Details'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  imageAsset,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                iceCreamFlavor,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(description, style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Rating: $rating', style: TextStyle(fontSize: 18)),
                  Icon(Icons.star, color: Colors.amber),
                ],
              ),
              // More content here...
            ],
          ),
        ),
      ),
    );
  }
}

class IceCreamListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ice Creams')),
      body: Stack(
        children: [
          // Your other UI elements here...

          Positioned(
            top: 110, // Adjust the position as needed
            right: -10,
            child: IconButton(
              icon: Icon(Icons.add, color: Colors.black),
              onPressed: () {
                // Open the Ice Cream Detail Page with actual data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => iceCreamDetailPage(
                      iceCreamFlavor: 'Strawberry',
                      imageAsset: 'assets/strawberry_ice_cream.png',
                      description: 'Delicious strawberry ice cream with fresh strawberries.',
                      rating: 4.5,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}