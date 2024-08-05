import 'package:assignment_e_commerce_app/screens/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/product.dart';
import '../service/api_service.dart';

class product_list extends StatefulWidget {
  const product_list({super.key});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<product_list> {
  late Future<List<Product>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder<List<Product>>(

        future: futureProducts,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            return ListView.builder(

              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> product_detail(product: product),
                    )
                    );
                  },
                  child: Card(

                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Adjust the radius here
                    ),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                    ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(16)), // Match the card radius
                  child: Image.network(
                  product.image,
                  width: 200,
                  height: 150,
                  fit: BoxFit.cover,
                  ),
                  ),

                  Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),

                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  Text(
                  product.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),

                  ),
                    Text(
                      product.brand,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey

                      ),
                    ),

                  const SizedBox(height: 8),

                  const SizedBox(height: 8),
                  Text(
                  '\$${product.price.toStringAsFixed(2)}'
                      ,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red
                    ),
                  )
                  ,
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
                    )]
                  )
                  )
                  )
                        ]
                  )
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load products'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 1,
        backgroundColor: Colors.white, // Set background to white
         // Color of selected item
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black, // Color of unselected items
        // Set to the index of the currently selected item
        onTap: (int index) {
          // Handle item tap
        },
      ),
    );
  }
}