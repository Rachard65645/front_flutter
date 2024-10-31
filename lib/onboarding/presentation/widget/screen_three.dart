import 'package:flutter/material.dart';
import '../../../shared/theme/app_colors.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/Deliveries.png'),
            ),
          ),
          const Text(
            'Welcome to ... GAS!!',
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Mon text lore upsu, gtd stftbhjd jhdtfd zdtftudz dtytftyftfd ghfdytftyed htfdytfdyts',
              style: TextStyle(
                color: AppColors.gray50,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
