import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/business_logic/register_bloc/register_bloc.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';
import 'package:gas/vendor/sellers/business_logique/bloc/sellers_bloc.dart';
import 'package:gas/vendor/sellers/presentation/fetch_seller_creen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<RegisterBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<SellersBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<SellerBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: const FetchSellerCreen(),
      ),
    );
  }
}
