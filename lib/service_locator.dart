import 'package:dio/dio.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/business_logic/register_bloc/register_bloc.dart';
import 'package:gas/auth/data/repositories/login_repository.dart';
import 'package:gas/auth/data/repositories/register_repository.dart';
import 'package:gas/auth/data/service/login_service.dart';
import 'package:gas/auth/data/service/register_service.dart';
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

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'http://192.168.1.77:4000/api'),
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
}
