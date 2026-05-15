import 'package:flutter/material.dart';

import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> sampleProducts = const [
    {
      'name': 'Gift Box',
      'category': 'Classic',
      'price': 24.99,
    },
    {
      'name': 'Smart Watch',
      'category': 'Tech',
      'price': 89.99,
    },
    {
      'name': 'Teddy Bear',
      'category': 'Toys',
      'price': 19.99,
    },
    {
      'name': 'Coffee Mug',
      'category': 'Home',
      'price': 12.99,
    },
    {
      'name': 'Notebook Set',
      'category': 'Stationery',
      'price': 15.99,
    },
    {
      'name': 'Headphones',
      'category': 'Tech',
      'price': 49.99,
    },
  ];

  final List<String> categories = const [
    'All',
    'Tech',
    'Toys',
    'Home',
    'Classic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Gift Store'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
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
                  itemCount: sampleProducts.length,

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.72,
                  ),

                  itemBuilder: (context, index) {
                    final product = sampleProducts[index];

                    return ProductCard(
                      name: product['name'],
                      category: product['category'],
                      price: product['price'],
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