import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/gas_bottles/business_logic/bloc/gas_bottles_bloc.dart';
import 'package:gas/nav_bar.dart';
import 'package:gas/service_locator.dart';

@RoutePage()
class FetchSellersCreen extends StatefulWidget {
  const FetchSellersCreen({super.key});

  @override
  _FetchSellersScreenState createState() => _FetchSellersScreenState();
}

class _FetchSellersScreenState extends State<FetchSellersCreen> {
  int _expandedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gs Categories',
          style: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      drawer: NavBar(),
      body: BlocBuilder<GasBottlesBloc, GasBottlesState>(
        builder: (context, state) {
          if (state is GasBottlesLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                color: Colors.amber,
              ),
            );
          }

          if (state.bottles?.isEmpty ?? true) {
            return const Center(
              child: Text(
                "No categories yet",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          if (state is GetGasBottlesSuccess) {
            return ListView.builder(
              itemCount: state.bottles!.length,
              itemBuilder: (context, index) {
                final bottle = state.bottles![index];

                final bool isExpanded = _expandedIndex == index;
                final double containerHeight = isExpanded ? 200.0 : 80.0;

                return GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      _expandedIndex = index; 
                    });
                  },
                  onTapUp: (_) {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      setState(() {
                        _expandedIndex = -1; 
                      });
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.all(8.0),
                    height: containerHeight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://$IpGlobal:4000/api/${bottle.image}'),
                        fit: BoxFit.contain, 
                      ),
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              bottle.gasStations.name,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              bottle.bottlesCategories.weight,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
