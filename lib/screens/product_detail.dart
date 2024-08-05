import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Add this dependency to your pubspec.yaml file

import '../models/product.dart';

class product_detail extends StatelessWidget {
  const product_detail({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              width: screenWidth,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                border: Border.all(
                  color: Colors.grey.shade300, // Border color
                  width: 2.0, // Border width
                ),
              ),
              child: Image.network(
                product.image,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Brand name
                Text(
                  product.brand,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Price
                Text(
                  '\$${product.price}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            // Title
            Text(
              product.title,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey

              ),
            ),
            const SizedBox(height: 2),
            // Rating bar
            RatingBar.builder(
              initialRating: product.rating.toDouble(),
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating update if needed
              },
            ),
            const SizedBox(height: 25),
            // Description
            Text(
              product.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle add to cart action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Background color
            padding: EdgeInsets.symmetric(vertical: 16.0), // Button padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Rounded corners
            ),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
