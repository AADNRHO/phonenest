import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: provider.favorites.isEmpty
          ? const Center(
              child: Text(
                "No favorite phones yet",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: provider.favorites.length,
              itemBuilder: (context, index) {
                final product = provider.favorites[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Image.network(
                      product.image,
                      width: 60,
                    ),
                    title: Text(product.name),
                    subtitle: Text("\$${product.price}"),
                    trailing: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
