import 'package:flutter/material.dart';
import '../models/pet.dart';

class DetailsScreen extends StatefulWidget {
  final Pet pet;

  const DetailsScreen({super.key, required this.pet});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.pet.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                widget.pet.isFavorite = !widget.pet.isFavorite;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   // Large Image
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                       child: Image.network(
                        widget.pet.imageUrl,
                        fit: BoxFit.contain,
                        height: 250,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Title and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                              Text(
                                widget.pet.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 4),
                               Text(
                                '395g', // Dummy weight
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                ),
                              ),
                           ],
                         ),
                       ),
                       Text(
                        '\$${widget.pet.price}',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),

                  // Rating and Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Rating
                      Row(
                        children: const [
                          Icon(Icons.star, color: Color(0xFFFE7D55), size: 20),
                          Icon(Icons.star, color: Color(0xFFFE7D55), size: 20),
                          Icon(Icons.star, color: Color(0xFFFE7D55), size: 20),
                          Icon(Icons.star, color: Color(0xFFFE7D55), size: 20),
                          Icon(Icons.star_border, color: Color(0xFFFE7D55), size: 20),
                        ],
                      ),
                      // Quantity
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 20),
                              onPressed: () {
                                if (quantity > 1) {
                                  setState(() {
                                    quantity--;
                                  });
                                }
                              },
                            ),
                            Text(
                              '$quantity',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 20),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  
                  // Product Detail List Tile
                  ExpansionTile(
                    title: const Text(
                      'Product Detail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(widget.pet.description),
                      ),
                    ],
                  ),
                   const Divider(),
                   // Composition List Tile
                   const ExpansionTile(
                    title: Text(
                      'Composition',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Chicken 50%, Rice 20%, Vegetables 30%'),
                      ),
                    ],
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
          
          // Bottom Cart Button
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
