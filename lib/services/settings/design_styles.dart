import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../settings.dart';

part 'config.dart';

class DesignStyles {
  static Color red = const Color(0xFFFF0000);

  static Color black = const Color(0xFF000000);

  static Color colorLight = const Color(0xFF9C9797);

  static Color colorDark = const Color(0xFF1C222A);

  static Color transparent = const Color(0x1A1C222A);

  static Color colorMiddle = const Color(0xFF6A655D);

  static Color colorVariate = const Color(0xFFEDB021);

  static Color colorVariateDark = const Color(0xFF825B00);

  static BorderRadiusGeometry borderRadiusButton = BorderRadius.circular(5);

  static void changeTheme(AppTheme theme) {
    colorLight = _colorLight[theme] ?? red;

    colorDark = _colorDark[theme] ?? red;

    transparent = _transparent[theme] ?? red;

    colorMiddle = _colorMiddle[theme] ?? red;

    colorVariate = _colorVariate[theme] ?? red;

    colorVariateDark = _colorVariateDark[theme] ?? red;
  }

  static String fontFamily = 'Nunito';

  static TextStyle textCustom({
    Color? color,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    bool isHeadline = false,
  }) {
    return TextStyle(
      color: color ?? colorDark,
      fontSize: fontSize,
      fontFamily: isHeadline
          ? listNamesOfFont[NamesOfFont.raleway] //
          : fontFamily,
      fontWeight: fontWeight,
    );
  }

  static Decoration buttonDecoration({
    Color? color,
    Color colorBoxShadow = const Color(0x33000000),
    Color? colorBorder,
    double blurRadius = 3,
    Offset offset = const Offset(0, 1),
    double borderRadius = 5,
  }) {
    return BoxDecoration(
      color: color ?? colorLight,
      boxShadow: [
        BoxShadow(
          color: colorBoxShadow,
          blurRadius: blurRadius,
          offset: offset,
        )
      ],
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(color: colorBorder ?? colorLight),
    );
  }

  static ThemeData get themeData {
    return ThemeData(
      fontFamily: listNamesOfFont[NamesOfFont.nunito],
      primaryColor: colorVariateDark,
    )..colorScheme.copyWith(secondary: colorVariateDark);
  }

  static const listNamesOfFont = {
    NamesOfFont.raleway: 'Raleway',
    NamesOfFont.nunito: 'Nunito',
    NamesOfFont.roboto: 'Roboto',
  };

  static const _colorLight = {
    AppTheme.dark: Color(0xFFdcdcdc),
  };

  static const _colorDark = {
    AppTheme.dark: Color(0xFF1c222a),
  };

  static const _transparent = {
    AppTheme.dark: Color(0x1A1c222a),
  };

  static const _colorMiddle = {
    AppTheme.dark: Color(0xFF6a655d),
  };

  static const _colorVariate = {
    AppTheme.dark: Color(0xFFedb021),
  };

  static const _colorVariateDark = {
    AppTheme.dark: Color(0xFF825b00),
  };

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Future<T?> dialog<T>(Widget child) async {
    if (context != null) {
      return showGeneralDialog<T?>(
        context: context!,
        pageBuilder: (_, __, ___) {
          return child;
        },
      );
    }
  }

  static Future<void> showSnackBar(
    String message, {
    Color? colorText,
    Color? backgroundColor,
    int milliseconds = 3000,
    bool isUpperCase = false,
  }) async {
    final snackbar = SnackBar(
      elevation: 3,
      backgroundColor: backgroundColor ?? colorDark,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(
        right: 15,
        left: 15,
        bottom: 100,
      ),
      padding: const EdgeInsets.all(5),
      content: Text(
        isUpperCase ? message : message,
        style: textCustom(
          color: colorText ?? red,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
      duration: Duration(milliseconds: milliseconds),
    );
    if (context != null) {
      ScaffoldMessenger.of(context!).showSnackBar(snackbar);
    }
  }

  static BuildContext? get context => navigatorKey.currentContext;
}

enum NamesOfFont {
  raleway,
  nunito,
  roboto,
}
