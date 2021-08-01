import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kPrimaryColor = Color(0xFFFFC61F);
const ksecondaryColor = Color(0xFFB5BFD0);
// const kTextColor = Color(0xFF50505D);
// const kTextLightColor = Color(0xFF6A727D);
// const kShadowColor = Color(0xFFFFC61F);

//Theme.of(context).primaryColor
//Theme.of(context).accentColor
// Theme.of(context).primaryTextTheme
ThemeData light = ThemeData(
  primaryColor: Color.fromRGBO(246, 248, 250, 1.0),
  accentColor: Color.fromRGBO(50, 50, 50, 1),
  primaryTextTheme: TextTheme(
    // Section Headings
    headline1: GoogleFonts.montserrat(
        color: Color.fromRGBO(59, 57, 60, 1),
        fontSize: 22,
        fontWeight: FontWeight.bold),

    headline2: GoogleFonts.montserrat(
        color: Color.fromRGBO(59, 57, 60, 1),
        fontSize: 19,
        fontWeight: FontWeight.w500),

        

    // List Font
    bodyText1: GoogleFonts.montserrat(
        color: Color.fromRGBO(105, 105, 108, 1),
        fontSize: 16,
        height: 1.5),
    bodyText2: GoogleFonts.montserrat(
      color: Color.fromRGBO(205, 205, 208, 1),
    ),
    headline5: GoogleFonts.montserrat(
        color: Color.fromRGBO(105, 105, 108, 1),
        fontSize: 15,
        fontWeight: FontWeight.bold),

    //
    // bodyText2: TextStyle(color: ksecondaryColor),
    // bodyText1: TextStyle(color: ksecondaryColor),
  ),
  primaryColorLight: Color(0xFFB0CCE1).withOpacity(0.3),
);

ThemeData dark = ThemeData(
    primaryColor: Color.fromRGBO(31, 31, 31, 1.0),
    accentColor: Color.fromRGBO(200, 200, 200, 1),
    dividerColor: Color.fromRGBO(200, 200, 200, 0.1),
    primaryTextTheme: TextTheme(
      // Section Headings
      headline1: GoogleFonts.montserrat(
          color: Color.fromRGBO(250, 250, 250, 1),
          fontSize: 22,
          fontWeight: FontWeight.bold),

      headline2: GoogleFonts.montserrat(
          color: Color.fromRGBO(225, 225, 225, 1),
          fontSize: 19,
          fontWeight: FontWeight.w500),

      // List Font
      bodyText1: GoogleFonts.montserrat(
          color: Color.fromRGBO(200, 200, 200, 1),fontSize: 16),
      bodyText2:
          GoogleFonts.montserrat(color: Color.fromRGBO(200, 200, 200, 1)),
      headline5: GoogleFonts.montserrat(
          color: Color.fromRGBO(200, 200, 200, 1), fontSize: 17),

      // List Font
    ),
    primaryColorLight: Color(0xFFB0CCE1).withOpacity(0.008),
    );

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool? _isDarkTheme;

  bool? get isDarkTheme => _isDarkTheme;

  ThemeNotifier() {
    _isDarkTheme = false;
    _getThemPref();
  }

  // Switch theme
  toggleTheme() {
    _isDarkTheme = !_isDarkTheme!;
    _setThemePrefs();
    notifyListeners();
  }

  // Get saved theme preference
  _getThemPref() async {
    await _initPrefs();
    _isDarkTheme = _prefs!.getBool(key) ?? false;
    notifyListeners();
  }

  // Set theme preference
  _setThemePrefs() async {
    await _initPrefs();
    _prefs!.setBool(key, _isDarkTheme!);
  }

  // Initiate a preference
  _initPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }
}
