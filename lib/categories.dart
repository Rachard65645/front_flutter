import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/stations/business_logique/bloc/stations_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StationsBloc, StationsState>(
      builder: (context, state) {
        if (state is StationsInitial) {
          context.read<StationsBloc>().add(GetStationsEvent());
        }

        if (state is StationsLoading) {
          return const CupertinoActivityIndicator();
        }

        if (state.stations?.isEmpty ?? true) {
          return const Center(child: Text("No sations yet"));
        }

        if (state is GetStationSSuccess) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: state.stations!.map((station) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.amber,
                          backgroundImage: CachedNetworkImageProvider(
                            'http://192.168.1.77:4000/api/${station.logo}', // URL de l'image avec cache
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        station.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }

        return Container();
      },
    );
  }
}
