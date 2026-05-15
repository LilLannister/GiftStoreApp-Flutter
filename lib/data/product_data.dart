import '../models/product.dart';

class ProductData {
  static List<Product> getProducts() {
    return [
      Product(
        id: 1,
        name: 'Classic Gift Box',
        description: 'A stylish gift box for birthdays and special occasions.',
        price: 24.99,
        imageUrl: 'assets/images/gift_box.png',
        category: 'Classic',
      ),
      Product(
        id: 2,
        name: 'Smart Watch',
        description: 'A modern tech gift for daily use.',
        price: 89.99,
        imageUrl: 'assets/images/smart_watch.png',
        category: 'Tech',
      ),
      Product(
        id: 3,
        name: 'Teddy Bear',
        description: 'A soft and cute toy gift.',
        price: 19.99,
        imageUrl: 'assets/images/teddy_bear.png',
        category: 'Toys',
      ),
      Product(
        id: 4,
        name: 'Coffee Mug',
        description: 'A simple mug for coffee lovers.',
        price: 12.99,
        imageUrl: 'assets/images/coffee_mug.png',
        category: 'Home',
      ),
      Product(
        id: 5,
        name: 'Notebook Set',
        description: 'A useful stationery gift set.',
        price: 15.99,
        imageUrl: 'assets/images/notebook_set.png',
        category: 'Stationery',
      ),
      Product(
        id: 6,
        name: 'Wireless Headphones',
        description: 'A practical tech gift for music lovers.',
        price: 49.99,
        imageUrl: 'assets/images/headphones.png',
        category: 'Tech',
      ),
    ];
  }
}