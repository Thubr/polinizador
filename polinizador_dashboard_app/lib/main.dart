// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

import 'package:polinizador_dashboard_app/pages/dashboard/DashboardScreen.dart';
import 'package:polinizador_dashboard_app/utils/letter_spacing.dart';

const Color gray = Color(0xFFD8D8D8);
const Color gray60 = Color(0x99D8D8D8);
const Color gray25 = Color(0x40D8D8D8);
const Color white60 = Color(0x99FFFFFF);
const Color primaryBackground = Color(0xFF33333D);
const Color inputBackground = Color(0xFF26282F);
const Color cardBackground = Color(0x03FEFEFE);
const Color buttonColor = Color(0xFF09AF79);
const Color focusColor = Color(0xCCFFFFFF);
const Color dividerColor = Color(0xAA282828);

void main() {
  runApp(RallyApp());
}

/// The RallyApp is a MaterialApp with a theme and 2 routes.
///
/// The home route is the main page with tabs for sub pages.
/// The login route is the initial route.
class RallyApp extends StatelessWidget {
  const RallyApp();

  static const String loginRoute = '/rally/login';
  static const String homeRoute = '/rally';

  final sharedZAxisTransitionBuilder = const SharedAxisPageTransitionsBuilder(
    fillColor: primaryBackground,
    transitionType: SharedAxisTransitionType.scaled,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Polinizador',
      debugShowCheckedModeBanner: false,
      theme: _buildRallyTheme().copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            for (var type in TargetPlatform.values)
              type: sharedZAxisTransitionBuilder,
          },
        ),
      ),
      initialRoute: homeRoute,
      routes: <String, WidgetBuilder>{
        homeRoute: (context) => const DashboardScreen(),
      },
    );
  }

  ThemeData _buildRallyTheme() {
    final base = ThemeData.dark();
    return ThemeData(
      appBarTheme: const AppBarTheme(brightness: Brightness.dark, elevation: 0),
      scaffoldBackgroundColor: primaryBackground,
      primaryColor: primaryBackground,
      focusColor: focusColor,
      textTheme: _buildRallyTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: gray,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: inputBackground,
        focusedBorder: InputBorder.none,
      ),
      visualDensity: VisualDensity.standard,
    );
  }

  TextTheme _buildRallyTextTheme(TextTheme base) {
    return base
        .copyWith(
      bodyText2: GoogleFonts.robotoCondensed(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(0.5),
      ),
      bodyText1: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w400,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
      button: GoogleFonts.robotoCondensed(
        fontWeight: FontWeight.w700,
        letterSpacing: letterSpacingOrNone(2.8),
      ),
      headline5: GoogleFonts.eczar(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacingOrNone(1.4),
      ),
    )
        .apply(
      displayColor: Colors.white,
      bodyColor: Colors.white,
    );
  }
}