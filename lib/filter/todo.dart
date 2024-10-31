import 'package:flutter/material.dart';
import 'package:gas/filter/products_model_search.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  late TextEditingController searchController;
  List<ProductsModelSearch> searchProducts = products;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            setState(() {
              searchProducts = products
                  .where((element) => element.description
                      .toLowerCase()
                      .contains(value.toString().toLowerCase()))
                  .toList();
            });

            print(searchProducts);
          },
          controller: searchController,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(13),
          child: ListView.builder(
              itemCount: searchProducts.length,
              itemBuilder: (context, index) {
                ProductsModelSearch productItem = searchProducts[index];
                return ListTile(title: Text(productItem.description));
              })),
    );
  }
}
