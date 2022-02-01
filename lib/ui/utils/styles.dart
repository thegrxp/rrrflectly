import 'package:flutter/material.dart';
import 'package:rrrflectly/ui/utils/colors.dart';

class Insets {
  static const xxs = 2.0;
  static const xs = 4.0;
  static const sm = 8.0;
  static const med = 12.0;
  static const lg = 16.0;
  static const xl = 24.0;
  static const xxl = 36.0;
  static const xxxl = 48.0;
  static const xxxxl = 90.0;
}

class Corners {
  static const double xs = 2;
  static const BorderRadius xsBorder = BorderRadius.all(xsRadius);
  static const Radius xsRadius = Radius.circular(xs);

  static const double sm = 4;
  static const BorderRadius smBorder = BorderRadius.all(smRadius);
  static const Radius smRadius = Radius.circular(sm);

  static const double med = 8;
  static const BorderRadius medBorder = BorderRadius.all(medRadius);
  static const Radius medRadius = Radius.circular(med);

  static const double lg = 10;
  static const BorderRadius lgBorder = BorderRadius.all(lgRadius);
  static const Radius lgRadius = Radius.circular(lg);

  static const double xl = 12;
  static const BorderRadius xlBorder = BorderRadius.all(xlRadius);
  static const Radius xlRadius = Radius.circular(xl);

  static const double xxl = 14;
  static const BorderRadius xxlBorder = BorderRadius.all(xxlRadius);
  static const Radius xxlRadius = Radius.circular(xxl);

  static const double max = 100;
  static const BorderRadius maxBorder = BorderRadius.all(maxRadius);
  static const Radius maxRadius = Radius.circular(max);
}

class FontSizes {
  static double get s8 => 8;
  static double get s10 => 10;
  static double get s11 => 11;
  static double get s13 => 13;
  static double get s15 => 15;
  static double get s16 => 16;
  static double get s20 => 20;
  static double get s24 => 24;
  static double get s36 => 36;
  static double get s48 => 48;
}

class TextStyles {
  static const TextStyle prompt = TextStyle(fontFamily: 'Prompt');

  static TextStyle get h0 => prompt.copyWith(fontSize: FontSizes.s48, color: AppColors.white, height: 1.1);

  static TextStyle get h1 => prompt.copyWith(fontSize: FontSizes.s36, color: AppColors.white, height: 1.1);
  static TextStyle get h1Dark => h1.copyWith(color: AppColors.greyDark);
  static TextStyle get h1Bold => h1.copyWith(fontWeight: FontWeight.bold);

  static TextStyle get h2 => prompt.copyWith(fontSize: FontSizes.s24, color: AppColors.white);
  static TextStyle get h2Dark => h2.copyWith(color: AppColors.greyDark);
  static TextStyle get h2Primary => h2.copyWith(color: AppColors.primary);
  static TextStyle get h2Secondary => h2.copyWith(color: AppColors.secondary);

  static TextStyle get h3 => prompt.copyWith(fontSize: FontSizes.s20, color: AppColors.white);
  static TextStyle get h3Dark => h3.copyWith(color: AppColors.greyDark);
  static TextStyle get h3Primary => h3.copyWith(color: AppColors.primary);
  static TextStyle get h3Secondary => h3.copyWith(color: AppColors.secondary);
  static TextStyle get h3Light => h3.copyWith(fontWeight: FontWeight.w200);

  static TextStyle get title1 => prompt.copyWith(fontSize: FontSizes.s16, color: AppColors.white);
  static TextStyle get title1Dark => title1.copyWith(color: AppColors.greyDark);
  static TextStyle get title1Primary => title1.copyWith(color: AppColors.primary);
  static TextStyle get title1Secondary => title1.copyWith(color: AppColors.secondary);

  static TextStyle get title2 => prompt.copyWith(fontSize: FontSizes.s15, color: AppColors.white);
  static TextStyle get title2Dark => title2.copyWith(color: AppColors.greyDark);
  static TextStyle get title2Secondary => title2.copyWith(color: AppColors.secondary);
  static TextStyle get title2Primary => title2.copyWith(color: AppColors.primary);

  static TextStyle get body1 => prompt.copyWith(fontSize: FontSizes.s13, color: AppColors.white);
  static TextStyle get body1Dark => body1.copyWith(color: AppColors.greyDark);
  static TextStyle get body1Primary => body1.copyWith(color: AppColors.primary);
  static TextStyle get body1Secondary => body1.copyWith(color: AppColors.secondary);
}
