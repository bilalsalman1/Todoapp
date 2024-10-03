import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/Screens/login_screen.dart';
import 'package:todo_app/styles/colors.dart';

import 'package:todo_app/models/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const WormEffect(
                  spacing: 8,
                  activeDotColor: Colors.white,
                  dotColor: Colors.white24,
                  dotHeight: 4,
                  dotWidth: 100,
                ),
                onDotClicked: (index) {
                  controller.animateToPage(index,
                      duration: const Duration(milliseconds: 2),
                      curve: Curves.bounceInOut);
                },
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                children: [
                  onboard(
                    context: context,
                    color: AppColors.primaryColor,
                    image: Image.asset(
                      'assets/images/Illustration.png',
                      height: 300,
                      width: 320,
                    ),
                    title: 'Manage Your \nDaily TO DO',
                    subtitle:
                        'Without much worry just manage \nthings as easy as piece of cake',
                  ),
                  onboard(
                    context: context,
                    color: AppColors.primaryColor,
                    image: Image.asset(
                      'assets/images/Illustration2.png',
                      height: 300,
                      width: 320,
                    ),
                    title: 'Manage Your \nDaily TO DO',
                    subtitle:
                        "  Your tasks, organized.\n Boost productivity now!",
                  ),
                  onboard(
                    context: context,
                    color: AppColors.primaryColor,
                    image: Image.asset(
                      'assets/images/Illustration3.png',
                      height: 300,
                      width: 320,
                    ),
                    title: 'Manage Your \nDaily TO DO',
                    subtitle: "Stay on track, stay productive. \nWelcome!",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const LoginScreen()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
