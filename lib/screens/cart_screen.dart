import 'package:flutter/material.dart';

import '../models/product.dart';

class CartScreen extends StatelessWidget {
  final List<Product> cartItems;

  const CartScreen({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    final double totalPrice = cartItems.fold(
      0,
      (total, product) => total + product.price,
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: cartItems.isEmpty
            ? Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shopping_cart_outlined,
                            size: 90,
                            color: Colors.deepPurple.shade200,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Your cart is empty',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Add products to your cart to see them here.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },
                      itemBuilder: (context, index) {
                        final product = cartItems[index];

                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.deepPurple.shade50,
                              child: const Icon(
                                Icons.card_giftcard,
                                color: Colors.deepPurple,
                              ),
                            ),
                            title: Text(product.name),
                            subtitle: Text(product.category),
                            trailing: Text(
                              '\$${product.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}