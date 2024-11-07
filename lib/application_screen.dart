import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gas/home_screen.dart';
import 'package:gas/nav_bar.dart';
import 'package:gas/station/presentation/get_stations_screen.dart';
import 'package:gas/vendor/sellers/presentation/fetch_seller_screen.dart';
import 'package:get/get.dart';

@RoutePage()
class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
        body: Obx(() => controller.screens[controller.sellectedIndex.value]),
        drawer: const NavBar(),
        bottomNavigationBar: Obx(
          () => NavigationBar(
              height: 80,
              elevation: 0,
              selectedIndex: controller.sellectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.sellectedIndex.value = index,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.shop), label: 'Store'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profile'),
                NavigationDestination(
                    icon: Icon(Icons.heart_broken_rounded), label: 'Witshlist'),
              ]),
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> sellectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const GetStationsScreen(),
    const FetchSellersCreen(),
    Container(
      color: Colors.red,
    )
  ];
}
