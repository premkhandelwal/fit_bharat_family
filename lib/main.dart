import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fit_bharat_family/config/routes.dart';
import 'package:fit_bharat_family/data/providers/auth_provider.dart';
import 'package:fit_bharat_family/logic/bloc/auth_bloc.dart';
import 'package:fit_bharat_family/presentation/screens/signin_screen.dart';

void main() {
  runApp( MyApp(authProvider: AuthProvider(),));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  const MyApp({
    Key? key,
    required this.authProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authProvider: authProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        routes: namedRoutes,
        home: SignInScreen(),
      ),
    );
  }
}

// ck_1e5ab733da6c08d0c43768742051ef518e13c2ba
// cs_246426a6fe8aa5f56ef797da76e1d4013463f99c