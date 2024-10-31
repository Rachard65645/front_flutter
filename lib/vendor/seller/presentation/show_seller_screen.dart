import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';

class ShowSellerScreen extends StatelessWidget {
  const ShowSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('seller'),
        centerTitle: true,
      ),
      body: BlocBuilder<SellerBloc, SellerState>(
        builder: (context, state) {
          if (state is SellerListInitial) {
            context
                .read<SellerBloc>()
                .add(GetSellerByIdEvent(id: state.seller!.id));
          }
          if (state is SellerListLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is GetSellerByIdSuccessState) {
            return Container(
              height: 100,
              width: 100,
              child: Image.network(
                  'http://192.168.1.77:4000/api/${state.seller!.cni}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
