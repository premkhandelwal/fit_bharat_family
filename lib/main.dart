import 'package:fit_bharat_family/data/providers/product_provider.dart';
import 'package:fit_bharat_family/logic/blocs/auth/auth_bloc.dart';
import 'package:fit_bharat_family/logic/blocs/product/product_bloc.dart';
import 'package:fit_bharat_family/presentation/screens/temp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fit_bharat_family/config/routes.dart';
import 'package:fit_bharat_family/data/providers/auth_provider.dart';

void main() {
  runApp( MyApp(authProvider: AuthProvider(), productProvider: ProductProvider(),));
}

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  final ProductProvider productProvider;
  const MyApp({
    Key? key,
    required this.authProvider,
    required this.productProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authProvider: authProvider),
        ),
        BlocProvider(
          create: (context) => ProductBloc(productProvider: productProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Fit Bharat Family',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'SansPro'
        ),
        routes: namedRoutes,
        home: const TempPage(),
      ),
    );
  }
}

// ck_1e5ab733da6c08d0c43768742051ef518e13c2ba
// cs_246426a6fe8aa5f56ef797da76e1d4013463f99c