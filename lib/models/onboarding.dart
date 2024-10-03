import 'package:flutter/material.dart';
import 'package:todo_app/styles/colors.dart';

Widget onboard ({
  required BuildContext context,
required Color color,
required Image image,
required String title,
required String subtitle,

}) {
return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    image,
    const SizedBox(height: 15),
    Text(title, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.textColor,
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                )),
                const SizedBox(height: 15),
              Text(subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: AppColors.textColor,
                  
                  fontSize: 22,
                  
                  fontStyle: FontStyle.italic,)
              ),
  ],
);
}