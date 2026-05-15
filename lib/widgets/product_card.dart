import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement full product card UI in feature/home-screen branch.
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(product.name),
        ),
      ),
    );
  }
}