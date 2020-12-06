import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polinizador_client_app/res/app_colors.dart';
import 'package:provider/provider.dart';

import 'models/product_catalog.dart';
import 'screens/home_screen.dart';
import 'services/firebase_repository.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsCatalog(FirebaseRepository()),
      builder: (context, child) {
        return MaterialApp(
          title: 'Polinizador',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            accentColor: AppColors.accent,
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
