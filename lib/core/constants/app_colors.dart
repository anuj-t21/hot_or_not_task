part of 'constants.dart';

class AppColors {
  AppColors._();

  static Color get backgroundColor => const Color(0xff24112F);
  static Color get borderColor => const Color(0xff584B60);
  static Color get purpleSecondary => const Color(0xff584B60);
  static Color get backgroundTertiary => const Color(0xff2F1C39);

  static Color get pureBlack => const Color(0xff000000);
  static Color get pureWhite => const Color(0xffffffff);
  static Color get darkPurple => const Color(0xff24112F);
  static Color get purpleTertiary => const Color(0xff301D3A);
  static Color get purple => const Color(0xff7F4975);
  static Color get pink => const Color(0xffC98FC1);
  static Color get darkGrey => const Color(0xff424242);
  static Color get powderAsh => const Color(0xffC9C9C9);
  static Color get green => const Color(0xff00C247);

  static Color get brightOrange => const Color(0xFFFF8B28);

  static Color get alertBlue => const Color(0xff004CEB);
  static Color get alertGreen => const Color(0xff339900);
  static Color get alertYellow => const Color(0xffffcc00);
  static Color get alertRed => const Color(0xffcc3300);
  static Color get alertOrange => const Color(0xffff9966);

  static Color get appWhite => const Color(0xffF5F5F7);

  static const orangeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xffff9966),
      Color(0xffffcc00),
    ],
  );
}
