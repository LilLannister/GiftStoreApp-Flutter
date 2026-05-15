import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final double price;

  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: const Icon(
                  Icons.card_giftcard,
                  size: 50,
                  color: Colors.deepPurple,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              category,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              '\$${price.toStringAsFixed(2)}',

              style: const TextStyle(
                color: Colors.deepPurple,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}