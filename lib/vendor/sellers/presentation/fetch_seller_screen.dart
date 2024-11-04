import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/router/app_router.gr.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';
import 'package:gas/vendor/sellers/business_logique/bloc/sellers_bloc.dart';

@RoutePage()
class FetchSellersCreen extends StatelessWidget {
  const FetchSellersCreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sellers'),
        centerTitle: true,
      ),
      body: BlocBuilder<SellersBloc, SellersState>(
        builder: (context, state) {
          if (state is SellersInitial) {
            context.read<SellersBloc>().add(GetSellerEvent());
          }

          if (state is SellersListLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (state.sellers?.isEmpty ?? true) {
            return const Center(child: Text("No sellers yet"));
          } else if (state is GetSellerSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                decoration: const BoxDecoration(
                    color: const Color.fromARGB(74, 0, 0, 0)),
                columns: const <DataColumn>[
                  DataColumn(
                      label: Text(
                    'Name',
                    style: TextStyle(color: Colors.amber),
                  )),
                  DataColumn(label: Text('show')),
                  DataColumn(label: Text('Refuse')),
                  DataColumn(label: Text('delete'))
                ],
                rows: state.sellers!.map<DataRow>((seller) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text(seller.users!.name)),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          getIt
                              .get<SellerBloc>()
                              .add(GetSellerByIdEvent(id: seller.id));
                          context.router.push(const ShowSellerRoute());
                        },
                        child: const Text('show'),
                      )),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          getIt
                              .get<SellerBloc>()
                              .add(ValidateSellerEvent(id: seller.id));
                          if (state is ValidateSellerSuccessState) {
                            getIt.get<SellersBloc>().add(GetSellerEvent());
                          }
                        },
                        child: const Text('Accepter'),
                      )),
                      DataCell(ElevatedButton(
                          onPressed: () {
                            context
                                .read<SellerBloc>()
                                .add(DeleteSellerEvent(id: seller.id));
                          },
                          child: const Text('delete')))
                    ],
                  );
                }).toList(),
              ),
            );
          }

          if (state is SellersFailureState) {
            return Center(
              child: Text(state.message),
            );
          }
          return Container();
        },
      ),
    );
  }
}
