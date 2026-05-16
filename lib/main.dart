import 'package:flutter/material.dart';

import 'models/product.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const GiftStoreApp());
}

class GiftStoreApp extends StatefulWidget {
  const GiftStoreApp({super.key});

  @override
  State<GiftStoreApp> createState() => _GiftStoreAppState();
}

class _GiftStoreAppState extends State<GiftStoreApp> {
  final List<Product> cartItems = [];

  void addToCart(Product product) {
    setState(() {
      cartItems.add(product);
    });
  }

  void removeFromCart(Product product) {
  setState(() {
    cartItems.remove(product);
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gift Store',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        overscroll: false,
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(
        cartItems: cartItems,
        onAddToCart: addToCart,
        onRemoveFromCart: removeFromCart,
        onClearCart: clearCart,
      ),
    );
  }
}