import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gas/auth/business_logic/login_bloc/login_bloc.dart';
import 'package:gas/auth/presentation/pages/login_screen.dart';
import 'package:gas/onboarding/presentation/pages/onboarding_screen.dart';

class AppInitScreen extends StatefulWidget {
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
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
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const OnboardingScreen()),
              (router) => false);
        } else if (state is CheckAuthStateSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const AppInitScreen()),
            (router) => false,
          );
        } else if (state is CheckAuthStateFailure) {
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
