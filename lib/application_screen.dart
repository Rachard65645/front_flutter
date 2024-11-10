import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/home_screen.dart';
import 'package:gas/nav_bar.dart';
import 'package:gas/positions/business_logic/bloc/position_bloc.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(206, 255, 98, 0),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(builder: (context) {
                        return IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            Scaffold.of(context)
                                .openDrawer(); // Ouvre le drawer
                          },
                        );
                      }),
                      const Text(
                        'HOME',
                        style: TextStyle(color: Colors.white),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(206, 255, 98, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Your location',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: Colors.white,
                              ),
                              BlocBuilder<PositionBloc, PositionState>(
                                builder: (context, state) {
                                  if (state is PositionInitial) {
                                    context
                                        .read<PositionBloc>()
                                        .add(GetPositionEvent());
                                  }
                                  if (state is PositionLoading) {
                                    return const CircularProgressIndicator(
                                      color: Colors.white,
                                    );
                                  }
                                  if (state is PositionSuccess) {
                                    return Text(
                                      state.position!.city,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    );
                                  }
                                  return Container();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Color.fromARGB(206, 255, 98, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: const NavBar(),
      body: Obx(() => controller.screens[controller.sellectedIndex.value]),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: Colors.grey[200], // Couleur de fond de la barre
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // Décalage de l'ombre
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              indicatorColor:
                  const Color.fromARGB(206, 255, 98, 0).withOpacity(0.2),
              labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              iconTheme: MaterialStateProperty.all(
                const IconThemeData(size: 28),
              ),
            ),
            child: NavigationBar(
              height: 70,
              selectedIndex: controller.sellectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.sellectedIndex.value = index,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.shop_outlined),
                  selectedIcon: Icon(Icons.shop),
                  label: 'Store',
                ),
                NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  selectedIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
                NavigationDestination(
                  icon: Icon(Icons.map_rounded),
                  selectedIcon: Icon(Icons.favorite),
                  label: 'Map',
                ),
              ],
            ),
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
    const CurrentStorePage()
  ];
}
