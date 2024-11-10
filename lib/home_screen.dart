import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gas/categories.dart';
import 'package:gas/vendor/stores/presentation/current_store_page.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Gas categories',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Naviguer vers la page "See All"
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromARGB(206, 255, 98, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Categories(), // Widget Categories
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Store',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Naviguer vers la page "See All"
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(
                      color: Color.fromARGB(206, 255, 98, 0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: CurrentStorePage()) // Widget GridView
        ],
      ),
    ));
  }
}
