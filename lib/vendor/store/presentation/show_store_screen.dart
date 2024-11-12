import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:gas/vendor/store/presentation/stock_screen.dart';

@RoutePage()
class ShowStoreScreen extends StatelessWidget {
  const ShowStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(206, 255, 98, 0),
      extendBody: true,
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state is Storeloading) {
            return const CupertinoActivityIndicator(
              color: Colors.orange,
            );
          }

          if (state is GetStoreByIdSuccess) {
            return SafeArea(
                child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.push(const ApplicationRoute());
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(Icons.more_vert, color: Colors.white)
                        ],
                      ),
                    ),
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      backgroundImage: CachedNetworkImageProvider(
                        'http://192.168.1.77:4000/api/${state.store?.logo}',
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      state.store!.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                    Text(
                      state.store!.pseudo,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.w600,
                        fontSize: 10,
                        letterSpacing: 0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            Text(
                              state.store!.seller.user.phone,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                            Text(
                              state.store!.seller.user.email,
                              style: const TextStyle(
                                color: Colors.white54,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About of ${state.store?.name}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                letterSpacing: 0,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "About of lo build_resolvers:transitive_digests on package:cached_network_image*",
                            style: TextStyle(
                              fontSize: 11,
                              height: 1.5,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                const Text(
                                  "Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black,
                                      letterSpacing: 0),
                                ),
                                const SizedBox(width: 5),
                                Container(
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
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(children: [
                              if (state.store?.stocks.isNotEmpty ?? false)
                                ...List.generate(
                                  state.store!.stocks.length,
                                  (index) => Padding(
                                    padding: index == 0
                                        ? const EdgeInsets.only(
                                            left: 15, right: 15)
                                        : const EdgeInsets.only(right: 15),
                                    child: StockScreen(
                                      stock: state.store!.stocks[index],
                                    ),
                                  ),
                                )
                              else
                                const Text('No stocks available'),
                            ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
          }
          return Container();
        },
      ),
    );
  }
}
