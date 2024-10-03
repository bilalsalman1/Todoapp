import 'package:flutter/material.dart';
import 'package:todo_app/styles/colors.dart';

class TextStyles {
  static TextStyle headingLarge = TextStyle(
      color: AppColors.textColor, 
      fontSize: 25, 
      fontWeight: FontWeight.bold
      );
      static TextStyle bodyText = TextStyle(
        fontSize: 17,
        color: AppColors.primaryColor,
      );
    static TextStyle todoListHeading = TextStyle(
      color: AppColors.primaryColor, 
      fontSize: 20, 
      fontWeight: FontWeight.w900
      );
      static TextStyle todoText = TextStyle(
        fontSize: 15,
        color: AppColors.textColor,
      );
     
}
