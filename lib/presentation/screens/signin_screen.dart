import 'package:fit_bharat_family/presentation/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String route = "signInScreen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AssetImage logo = const AssetImage("assets/images/logo.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Center(child: Image(image: logo)),
            const SizedBox(height: 50),
            const Text("Login",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange)),
            const SizedBox(height: 50),
            TextFormField(
              // controller: widget.textEditingController,
              cursorColor: Colors.green,
              autocorrect: true,

              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                counterStyle: TextStyle(fontSize: 15, color: Colors.white),

                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),

                errorStyle: TextStyle(
                  color: Colors.orange,
                  fontSize: 13,
                ),
                //labelStyle: TextStyle(color: Colors.blueGrey[300]),

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelText: "UserName",
                labelStyle: TextStyle(color: Colors.green, height: 1),
                hintText: "UserName",
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              // controller: widget.textEditingController,
              cursorColor: Colors.green,
              autocorrect: true,

              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                counterStyle: TextStyle(fontSize: 15, color: Colors.white),

                focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),

                errorStyle: TextStyle(
                  color: Colors.orange,
                  fontSize: 13,
                ),
                //labelStyle: TextStyle(color: Colors.blueGrey[300]),

                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                  ),
                ),
                labelText: "Password",
                labelStyle: TextStyle(color: Colors.green, height: 1),
                hintText: "Password",
                alignLabelWithHint: true,
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Sign In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(330, 60),
                  shape: const StadiumBorder(
                      // side: BorderSide()
                      )),
            ),
            // SizedBox(height: 60),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        SignUpScreen.route,
                      );
                    },
                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)))
              ],
            ),
            // const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
