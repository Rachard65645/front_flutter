import 'package:flutter/material.dart';
import 'package:gas/onboarding/presentation/widget/screen_one.dart';
import 'package:gas/onboarding/presentation/widget/screen_three.dart';
import 'package:gas/onboarding/presentation/widget/screen_two.dart';
import 'package:gas/shared/extensions/context_extensions.dart';
import 'package:gas/shared/theme/app_colors.dart';
import 'package:gas/shared/widgets/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../auth/presentation/pages/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  String bouttonText = "";
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPage = index;
              if (index == 2) {
                bouttonText = "Next";
              } else {
                bouttonText = "Finish";
              }
              setState(() {});
            },
            children: const [
              ScreenOne(),
              ScreenTwo(),
              ScreenThree(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  currentPage == 2
                      ? const SizedBox(
                          width: 10,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('skip',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                            GestureDetector(
                              onTap: () {
                                pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          242, 255, 98, 0)),
                                  color: const Color.fromARGB(242, 255, 98, 0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  'Next',
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      color: AppColors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                  currentPage == 2
                      ? const SizedBox(
                          width: 10,
                        )
                      : GapH(30),
                  currentPage != 2
                      ? const SizedBox(
                          width: 10,
                        )
                      : GestureDetector(
                          onTap: () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease);

                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (router) => false,
                            );
                          },
                          child: Container(
                            height: 30,
                            width: 200,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(242, 255, 98, 0)),
                              color: const Color.fromARGB(242, 255, 98, 0),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Finich',
                              style: context.textTheme.bodyLarge?.copyWith(
                                  color: AppColors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                  currentPage != 2
                      ? const SizedBox(
                          width: 10,
                        )
                      : const GapH(70),
                ],
              )),
        ],
      ),
    );
  }
}
