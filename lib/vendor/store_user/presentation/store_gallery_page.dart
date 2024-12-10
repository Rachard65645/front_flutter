import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/store_user/business_logique/bloc/store_user_bloc.dart';

@RoutePage()
class StoreGalleryPage extends StatefulWidget {
  const StoreGalleryPage({super.key});

  @override
  State<StoreGalleryPage> createState() => _StoreGalleryPageState();
}

class _StoreGalleryPageState extends State<StoreGalleryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Stores',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<StoreUserBloc, StoreUserState>(
        builder: (context, state) {
          if (state is StoreUserInitial) {
            getIt.get<StoreUserBloc>().add(MyStoreEvnet());
          }

          if (state is StoreUserLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is StoreUserSuccess) {
            final stores = state.stores;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Nombre de colonnes
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: stores?.length,
                itemBuilder: (context, index) {
                  final store = stores![index];

                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 5.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    'http://$IpGlobal:4000/api/${store.logo}',
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  store.name,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  store.address,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }

          if (state is StoreUserfailure) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(CreateStoresRoute());
        },
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(Icons.add, size: 30.0),
      ),
    );
  }
}
