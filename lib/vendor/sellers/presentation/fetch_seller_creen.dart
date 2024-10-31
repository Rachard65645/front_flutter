import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';
import 'package:gas/vendor/seller/presentation/show_seller_screen.dart';
import 'package:gas/vendor/sellers/business_logique/bloc/sellers_bloc.dart';

class FetchSellerCreen extends StatelessWidget {
  const FetchSellerCreen({super.key});

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
                      DataCell(Text(seller.users.name)),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          context
                              .read<SellerBloc>()
                              .add(GetSellerByIdEvent(id: seller.id));
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const ShowSellerScreen()),
                          );
                        },
                        child: const Text('show'),
                      )),
                      DataCell(ElevatedButton(
                        onPressed: () {
                          context
                              .read<SellerBloc>()
                              .add(RefuseSellerEvent(id: seller.id));
                        },
                        child: const Text('Refuser'),
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
