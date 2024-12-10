import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/categories_screen.dart';
import 'package:gas/nav_bar.dart';
import 'package:gas/positions/business_logic/bloc/position_bloc.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:gas/vendor/stores/business_logic/bloc/stores_bloc.dart';
import 'package:shimmer/shimmer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 1,
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(SearchStoresRoute());
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      drawer: const NavBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section des catégories
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<PositionBloc, PositionState>(
              builder: (context, state) {
                if (state is PositionInitial) {
                  getIt.get<PositionBloc>().add(GetPositionEvent());
                }

                if (state is PositionLoading) {
                  return CircularProgressIndicator();
                }

                if (state is PositionSuccess) {
                  return Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.orange,
                      ),
                      Text(
                        state.position!.city,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      )
                    ],
                  );
                }

                if (state is PositionFailure) {}
                return Container();
              },
            ),
          ),
          CategoriesScreen(),
          const SizedBox(height: 20),
          // Liste des magasins
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Shops closest to you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BlocBuilder<StoresBloc, StoresState>(
              builder: (context, state) {
                if (state is StoresInitial) {
                  context.read<StoresBloc>().add(FetchStoreEvent());
                }

                if (state is Storesloading) {
                  return ListView.builder(
                    itemCount: 6,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundColor: Colors.grey[300],
                            ),
                            title: Container(
                              width: double.infinity,
                              height: 10.0,
                              color: Colors.grey[300],
                            ),
                            subtitle: Container(
                              width: 150,
                              height: 10.0,
                              color: Colors.grey[300],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }

                if (state.stores?.isEmpty ?? true) {
                  return const Center(child: Text("No sellers yet"));
                }

                if (state is FetchStoreSuccess) {
                  return ListView.builder(
                    itemCount: state.stores!.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final store = state.stores![index];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: CachedNetworkImageProvider(
                              'http://$IpGlobal:4000/api/${store.logo}',
                            ),
                            backgroundColor:
                                const Color.fromARGB(206, 255, 98, 0),
                          ),
                          title: Text(
                            store.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                store.city,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Text(
                                store.address,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          trailing: Container(
                            height: 25,
                            width: 60,
                            decoration: BoxDecoration(
                              color: store.statusStore == "close"
                                  ? Colors.redAccent
                                  : Colors.greenAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                store.statusStore,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            getIt
                                .get<StoreBloc>()
                                .add(GetStoreByIdEven(id: store.id));
                            context.router.push(const ShowStoreRoute());
                          },
                        ),
                      );
                    },
                  );
                }

                return const Center(child: Text("Something went wrong"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
