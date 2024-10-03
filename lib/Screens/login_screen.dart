import 'package:flutter/material.dart';
import 'package:todo_app/Screens/home_screen.dart';
import 'package:todo_app/styles/colors.dart';

import 'package:todo_app/styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLogin = true;
  login(context) {
    
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(email: emailController.text)));
  }

  getPassword(getPassword) {
    // ignore: avoid_print
    print('$getPassword');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 25),
              child: Text(
                isLogin ? 'Log In' : 'Sign Up',
                style: TextStyles.headingLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 55, right: 55),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                      color: AppColors.textColor.withOpacity(0.3),
                      fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.textFieldColor,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 55, right: 55),
              child: TextField(
                onChanged: (value) => getPassword(value),
                controller: passController,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                      color: AppColors.textColor.withOpacity(0.3),
                      fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: AppColors.textFieldColor,
                  filled: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primaryColor,
                    backgroundColor: AppColors.buttonColor),
                onPressed: () {
                  login(context);
                },
                child: Text(
                  isLogin ? 'Log In' : 'Sign Up',
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    isLogin
                        ? 'Dont\'t have an account?'
                        : 'Already have an account?',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(
                      isLogin ? 'Sign Up' : 'Log In',
                      style: TextStyle(color: AppColors.buttonColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
