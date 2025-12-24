import 'package:_03_islami/home/home_screen.dart';
import 'package:_03_islami/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Islami());
}

class Islami extends StatelessWidget {
  const Islami({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName : (context) => HomeScreen(),
      },
    );
  }
}
