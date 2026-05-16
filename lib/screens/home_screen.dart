import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> cartItems;
  final Function(Product) onAddToCart;
  final Function(Product) onRemoveFromCart;
  final VoidCallback onClearCart;

  const HomeScreen({
    super.key,
    required this.cartItems,
    required this.onAddToCart,
    required this.onClearCart,
    required this.onRemoveFromCart,
  });

  @override
  Widget build(BuildContext context) {
    final products = ProductData.getProducts();

    final categories = [
      'All',
      'Tech',
      'Toys',
      'Home',
      'Classic',
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Gift Store'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    cartItems: cartItems,
                    onRemoveFromCart: onRemoveFromCart,
                    onClearCart: onClearCart,
                  ),
                ),
              );
            },
            icon: Stack(
              children: [
                const Icon(Icons.shopping_cart_outlined),

                if (cartItems.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 18,
                        minHeight: 18,
                      ),
                      child: Text(
                        '${cartItems.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Find the perfect gift',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Explore popular gifts for every occasion.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 42,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 10);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.deepPurple.shade100,
                        ),
                      ),
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Popular Gifts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              product: product,
                              onAddToCart: onAddToCart,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}