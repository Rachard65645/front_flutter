import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/categories_screen.dart';
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
      body: Column(
        children: [
          // Ajoutez vos catégories ici
          CategoriesScreen(),
          // BlocBuilder pour afficher les magasins
          Expanded(
            child: BlocBuilder<StoresBloc, StoresState>(
              builder: (context, state) {
                if (state is StoresInitial) {
                  context.read<StoresBloc>().add(FetchStoreEvent());
                }

                if (state is Storesloading) {
                  return ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
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
                      itemBuilder: (contex, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Color.fromARGB(206, 255, 98, 0),
                            backgroundImage: CachedNetworkImageProvider(
                              'http://192.168.1.77:4000/api/${state.stores![index].logo}',
                            ),
                          ),
                          title: Text(
                            state.stores![index].name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          subtitle: Text(
                            state.stores![index].pseudo,
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: Container(
                            height: 20,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(82, 76, 175, 79),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: const Center(
                              child: Text(
                                'Open',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          onTap: () {
                            getIt.get<StoreBloc>().add(
                                GetStoreByIdEven(id: state.stores![index].id));
                            contex.router.push(const ShowStoreRoute());
                          },
                        );
                      });
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
