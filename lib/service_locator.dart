import 'package:dio/dio.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/business_logic/register_bloc/register_bloc.dart';
import 'package:gas/auth/data/repositories/login_repository.dart';
import 'package:gas/auth/data/repositories/register_repository.dart';
import 'package:gas/auth/data/service/login_service.dart';
import 'package:gas/auth/data/service/register_service.dart';
import 'package:gas/shared/token_interceptor.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'https://4cc9-102-244-222-121.ngrok-free.app/api'),
  )..interceptors.add(TokenInterceptor()));

  getIt.registerSingleton(RegisterService(http: getIt.get<Dio>()));
  getIt.registerSingleton(RegisterRepository(service: getIt.get<RegisterService>()));
  getIt.registerSingleton(RegisterBloc(repository: getIt.get<RegisterRepository>()));

  getIt.registerSingleton(LoginService(http:getIt.get<Dio>()));
  getIt.registerSingleton(LoginRepository(service: getIt.get<LoginService>()));
  getIt.registerSingleton(LoginBloc(repository: getIt.get<LoginRepository>()));
}
