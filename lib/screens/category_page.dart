import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'product_details_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);

    final categories = ["Apple", "Samsung", "Xiaomi", "OnePlus", "Google"];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          final products =
              provider.products.where((p) => p.category == category).toList();

          return ExpansionTile(
            title: Text(
              category,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            children: products.map((product) {
              return ListTile(
                leading: Image.network(
                  product.image,
                  width: 50,
                ),
                title: Text(product.name),
                subtitle: Text("\$${product.price}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsPage(product: product),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
