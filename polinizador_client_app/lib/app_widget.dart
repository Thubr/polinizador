import 'package:flutter/material.dart';
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
          theme: ThemeData(
            primaryColor: Colors.deepPurple,
            accentColor: Colors.amber,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: const HomeScreen(),
        );
      },
    );
  }
}
