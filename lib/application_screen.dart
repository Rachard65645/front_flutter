import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gas/home_screen.dart';
import 'package:gas/station/presentation/get_stations_screen.dart';
import 'package:gas/vendor/sellers/presentation/fetch_seller_screen.dart';
import 'package:gas/vendor/stores/presentation/current_store_page.dart';
import 'package:get/get.dart';

@RoutePage()
class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      body: Obx(() => controller.screens[controller.sellectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.white, 
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, -5), 
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              NavigationBarTheme(
                data: NavigationBarThemeData(
                  indicatorColor: const Color.fromARGB(255, 255, 98, 0)
                      .withOpacity(0.2), 
                  labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  iconTheme: MaterialStateProperty.all(
                    const IconThemeData(size: 28),
                  ),
                ),
                child: NavigationBar(
                  height: 70,
                  selectedIndex: controller.sellectedIndex.value,
                  onDestinationSelected: (index) {
                    controller.sellectedIndex.value = index;
                  },
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.delivery_dining_outlined),
                      selectedIcon: Icon(Icons.delivery_dining),
                      label: 'Delivery',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.category_outlined),
                      selectedIcon: Icon(Icons.category_sharp),
                      label: 'Categories',
                    ),
                    NavigationDestination(
                      icon: Icon(Icons.map_outlined),
                      selectedIcon: Icon(Icons.map_rounded),
                      label: 'Map',
                    ),
                  ],
                ),
              ),
              // Ajout d'un bouton flottant central
              // Positioned(
              //   top: -25,
              //   left: MediaQuery.of(context).size.width / 2 - 30,
              //   child: FloatingActionButton(
              //     backgroundColor: Colors.deepOrangeAccent,
              //     elevation: 4,
              //     onPressed: () {
              //       controller.sellectedIndex.value = 1; // Exemple d'action
              //     },
              //     child: const Icon(Icons.shopping_cart),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> sellectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const GetStationsScreen(),
    const FetchSellersCreen(),
    const CurrentStorePage(),
  ];
}
