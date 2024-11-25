import 'package:dio/dio.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/business_logic/register_bloc/register_bloc.dart';
import 'package:gas/auth/data/repositories/login_repository.dart';
import 'package:gas/auth/data/repositories/register_repository.dart';
import 'package:gas/auth/data/service/login_service.dart';
import 'package:gas/auth/data/service/register_service.dart';
import 'package:gas/gas_bottles/business_logic/bloc/gas_bottles_bloc.dart';
import 'package:gas/gas_bottles/data/reposetories/gas_bottles_reposetory.dart';
import 'package:gas/gas_bottles/data/services/gas_bottles_service.dart';
import 'package:gas/orders/business_logique/bloc/orders_bloc.dart';
import 'package:gas/orders/data/reposetories/orders_reposetory.dart';
import 'package:gas/orders/data/services/orders_service.dart';
import 'package:gas/positions/business_logic/bloc/position_bloc.dart';
import 'package:gas/positions/data/reposetories/position_reposetory.dart';
import 'package:gas/positions/data/services/position_service.dart';
import 'package:gas/shared/token_interceptor.dart';
import 'package:gas/station/business_logique/bloc/station_bloc.dart';
import 'package:gas/station/data/repositories/station_repository.dart';
import 'package:gas/station/data/services/station_service.dart';
import 'package:gas/stations/business_logique/bloc/stations_bloc.dart';
import 'package:gas/stations/data/repositories/stations_repository.dart';
import 'package:gas/stations/data/services/stations_service.dart';
import 'package:gas/vendor/seller/business_logique/bloc/seller_bloc.dart';
import 'package:gas/vendor/seller/data/reposetories/seller_reposetories.dart';
import 'package:gas/vendor/seller/data/services/seller_service.dart';
import 'package:gas/vendor/sellers/business_logique/bloc/sellers_bloc.dart';
import 'package:gas/vendor/sellers/data/reposetories/sellers_reposetory.dart';
import 'package:gas/vendor/sellers/data/services/sellers_service.dart';
import 'package:gas/vendor/store/business_logique/bloc/store_bloc.dart';
import 'package:gas/vendor/store/data/repositories/store_repository.dart';
import 'package:gas/vendor/store/data/services/store_service.dart';
import 'package:gas/vendor/stores/business_logic/bloc/stores_bloc.dart';
import 'package:gas/vendor/stores/data/reposetories/stores_reposetory.dart';
import 'package:gas/vendor/stores/data/services/stores_service.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

const String IpGlobal = '192.168.1.77';

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'http://$IpGlobal:4000/api'),
  )..interceptors.add(TokenInterceptor()));

  getIt.registerSingleton(RegisterService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      RegisterRepository(service: getIt.get<RegisterService>()));
  getIt.registerSingleton(
      RegisterBloc(repository: getIt.get<RegisterRepository>()));

  getIt.registerSingleton(LoginService(http: getIt.get<Dio>()));
  getIt.registerSingleton(LoginRepository(service: getIt.get<LoginService>()));
  getIt.registerSingleton(LoginBloc(repository: getIt.get<LoginRepository>()));

  getIt.registerSingleton(SellerService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      SellerReposetories(service: getIt.get<SellerService>()));
  getIt.registerSingleton(
      SellerBloc(repository: getIt.get<SellerReposetories>()));

  getIt.registerSingleton(SellersService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      SellersReposetory(service: getIt.get<SellersService>()));
  getIt.registerSingleton(
      SellersBloc(repository: getIt.get<SellersReposetory>()));

  getIt.registerSingleton(StationsService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      StationsRepository(service: getIt.get<StationsService>()));
  getIt.registerSingleton(
      StationsBloc(repository: getIt.get<StationsRepository>()));

  getIt.registerSingleton(StationService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      StationRepository(service: getIt.get<StationService>()));
  getIt.registerSingleton(
      StationBloc(repository: getIt.get<StationRepository>()));

  getIt.registerSingleton(PositionService(http: getIt.get<Dio>()));
  getIt.registerSingleton(
      PositionReposetory(service: getIt.get<PositionService>()));
  getIt.registerSingleton(
      PositionBloc(reposetory: getIt.get<PositionReposetory>()));

  getIt.registerSingleton(StoresService(http: getIt.get<Dio>()));
  getIt
      .registerSingleton(StoresReposetory(service: getIt.get<StoresService>()));
  getIt
      .registerSingleton(StoresBloc(reposetory: getIt.get<StoresReposetory>()));

  getIt.registerSingleton(StoreService(http: getIt.get<Dio>()));
  getIt.registerSingleton(StoreRepository(service: getIt.get<StoreService>()));
  getIt.registerSingleton(StoreBloc(repository: getIt.get<StoreRepository>()));


  getIt.registerSingleton(GasBottlesService(http: getIt.get<Dio>()));
  getIt.registerSingleton(GasBottlesReposetory (service: getIt.get<GasBottlesService>()));
  getIt.registerSingleton(GasBottlesBloc(reposetory: getIt.get<GasBottlesReposetory>()));

  getIt.registerSingleton(OrdersService(http: getIt.get<Dio>()));
  getIt.registerSingleton(OrdersReposetory (service: getIt.get<OrdersService>()));
  getIt.registerSingleton(OrdersBloc(reposetory: getIt.get<OrdersReposetory>()));
}
