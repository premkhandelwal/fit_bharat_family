import 'package:fit_bharat_family/presentation/screens/home_screen.dart';
import 'package:fit_bharat_family/presentation/screens/signin_screen.dart';
import 'package:fit_bharat_family/presentation/screens/signup_screen.dart';
import 'package:fit_bharat_family/presentation/screens/temp_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext context)> namedRoutes = {
  SignInScreen.route: (ctx) => const SignInScreen(),
  SignUpScreen.route: (ctx) => const SignUpScreen(),
  HomeScreen.route: (ctx) => const HomeScreen(),
  TempPage.route: (ctx) => const TempPage(),
};
