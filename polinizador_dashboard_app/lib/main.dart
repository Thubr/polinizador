// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';

import 'package:polinizador_dashboard_app/DashboardScreen.dart';
import 'package:polinizador_dashboard_app/theme.dart';
import 'package:polinizador_dashboard_app/utils/letter_spacing.dart';

void main() {
  runApp(RallyApp());
}

/// The RallyApp is a MaterialApp with a theme and 2 routes.
///
/// The home route is the main page with tabs for sub pages.
/// The login route is the initial route.
class RallyApp extends StatelessWidget {
  const RallyApp();

  static const String homeRoute = '/home';

  final sharedZAxisTransitionBuilder = const SharedAxisPageTransitionsBuilder(
    fillColor: PolinizadorColors.primaryBackground,
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
    return ThemeData(
      appBarTheme: const AppBarTheme(brightness: Brightness.dark, elevation: 0),
      scaffoldBackgroundColor: PolinizadorColors.primaryBackground,
      primaryColor: PolinizadorColors.primaryBackground,
      focusColor: PolinizadorColors.focusColor,
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: PolinizadorColors.gray,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: PolinizadorColors.inputBackground,
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