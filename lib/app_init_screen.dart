import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/application_screen.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/presentation/pages/login_screen.dart';
import 'package:gas/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:gas/products/business_logic/bloc/products_bloc.dart';
import 'package:gas/service_locator.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(CheckAuthStateEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is FistTimeLaunch) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
              (router) => false);
        }
        if (state is CheckAuthStateSuccess) {
          getIt<ProductsBloc>().add(FetchProductEven());
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const ApplicationScreen()),
            (router) => false,
          );
        }
        if (state is CheckAuthStateFailure) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
            (router) => false,
          );
        }
      },
      child: const Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 40,
          ),
        ),
      ),
    );
  }
}
