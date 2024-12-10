import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/station/business_logique/bloc/station_bloc.dart';
import 'package:gas/stations/business_logique/bloc/stations_bloc.dart';

@RoutePage()
class GetStationsScreen extends StatelessWidget {
  const GetStationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stations'),
      ),
      body: BlocBuilder<StationsBloc, StationsState>(
        builder: (context, state) {
          if (state is StationsInitial) {
            getIt.get<StationsBloc>().add(GetStationsEvent());
          }

          if (state is StationsLoading) {
            return const CupertinoActivityIndicator();
          }

          if (state.stations?.isEmpty ?? true) {
            return const Center(child: Text("No sations yet"));
          }

          if (state is GetStationSSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Add the stations'),
                      ElevatedButton(
                        onPressed: () {
                          context.router.push(const CreateStationRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.stations!.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          width: 144,
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(69, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  state.stations![index].name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 29,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit,
                                        color: Colors.blue),
                                    onPressed: () {
                                      getIt.get<StationBloc>().add(
                                          UpdateStationEvent(
                                              id: state.stations![index].id,
                                              name:
                                                  state.stations![index].name));
                                      context.router
                                          .push(const UpdateStationRoute());
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.red),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is StationsFailure) {
            return Container();
          }

          if (state.stations?.isEmpty ?? true) {}
          return Container();
        },
      ),
    );
  }
}
