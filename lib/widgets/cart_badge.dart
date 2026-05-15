import 'package:flutter/material.dart';

class CartBadge extends StatelessWidget {
  final int itemCount;
  final Widget child;

  const CartBadge({
    super.key,
    required this.itemCount,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Implement badge overlay in feature/cart-state branch.
    return Stack(
      alignment: Alignment.topRight,
      children: [
        child,
        if (itemCount > 0)
          CircleAvatar(
            radius: 8,
            backgroundColor: Colors.red,
            child: Text(
              '$itemCount',
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
      ],
    );
  }
}