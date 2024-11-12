import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/vendor/stores/data/model/stores_model.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key, required this.stock});
  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10), // Réduit le padding pour éviter les coupures
      child: Container(
        width: 150, // Largeur fixe pour chaque conteneur
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange,
                  backgroundImage: CachedNetworkImageProvider(
                    'http://192.168.1.77:4000/api/${stock.gasBottle.image}',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stock.gasBottle.gasStation.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        stock.gasBottle.bottleCategory.weight,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
