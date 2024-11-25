import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/business_logic/register_bloc/register_bloc.dart';
import 'package:gas/gas_bottles/business_logic/bloc/gas_bottles_bloc.dart';
import 'package:gas/orders/business_logique/bloc/orders_bloc.dart';
import 'package:gas/positions/business_logic/bloc/position_bloc.dart';
import 'package:gas/router/app_router.dart';
import 'package:gas/service_locator.dart';
import 'package:gas/station/business_logique/bloc/station_bloc.dart';
import 'package:gas/stations/business_logique/bloc/stations_bloc.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';
import 'package:gas/vendor/sellers/business_logique/bloc/sellers_bloc.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:gas/vendor/stores/business_logic/bloc/stores_bloc.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
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
        BlocProvider(
          create: (context) => getIt.get<StationBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<StationsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<PositionBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<StoresBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<StoreBloc>(),
        ),
         BlocProvider(
          create: (context) => getIt.get<GasBottlesBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<OrdersBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
