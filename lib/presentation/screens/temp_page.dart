import 'package:fit_bharat_family/presentation/screens/home_screen.dart';
import 'package:fit_bharat_family/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  static String route = "tempScreen";

  const TempPage({ Key? key }) : super(key: key);

  @override
  _TempPageState createState() => _TempPageState();
  }
  
  class _TempPageState extends State<TempPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  SignInScreen.route,
                );
              },
              child: const Text("Login/SignUp Screen"),
              style: ElevatedButton.styleFrom(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  HomeScreen.route,
                );
              },
              child: const Text("Home Screen"),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}