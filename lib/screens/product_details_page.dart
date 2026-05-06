import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة المنتج
            Center(
              child: Image.network(
                product.image,
                height: 250,
              ),
            ),

            const SizedBox(height: 20),

            // الاسم
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // السعر
            Text(
              "\$${product.price}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            // التصنيف
            Text(
              "Category: ${product.category}",
              style: const TextStyle(fontSize: 16),
            ),

            const Spacer(),

            // الأزرار
            Row(
              children: [
                // زر المفضلة
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      provider.toggleFavorite(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Updated Favorites ❤️"),
                        ),
                      );
                    },
                    icon: Icon(
                      product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    label: const Text("Favorite"),
                  ),
                ),

                const SizedBox(width: 10),

                // زر السلة
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      provider.addToCart(product);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Added to Cart 🛒"),
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text("Add"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
