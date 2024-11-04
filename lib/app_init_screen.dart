import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/router/app_router.gr.dart';

@RoutePage()
class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed( const Duration(seconds: 5), () {
      print('object');
    });
    context.read<LoginBloc>().add(CheckAuthStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is FistTimeLaunch) {
          context.router.replaceAll([const OnboardingRoute()]);
        } else if (state is CheckAuthStateSuccess) {
          context.router.replaceAll([const ApplicationRoute()]);
        } else if (state is CheckAuthStateFailure) {
          context.router.replaceAll([const LoginRoute()]);
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
