import 'package:fit_bharat_family/config/globals/common_functions.dart';
import 'package:fit_bharat_family/data/models/user.dart';
import 'package:fit_bharat_family/logic/bloc/auth_bloc.dart';
import 'package:fit_bharat_family/presentation/screens/home_screen.dart';
import 'package:fit_bharat_family/presentation/screens/signin_screen.dart';
import 'package:flutter/material.dart';

import 'package:fit_bharat_family/presentation/screens/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  static String route = "signUpScreen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AssetImage logo = const AssetImage("assets/images/logo.png");
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late AuthBloc authBloc;
  @override
  void initState() {
    authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeScreen.route,
              (route) => false
            );
          } else if (state is SignUpFailureState) {
            showSnackBar(context, "Failed to sign up");
          }
        },
        builder: (context, state) {
          if (state is SignUpInProgressState) {
            return Center(child: const CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(20.0),
            shrinkWrap: true,

            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50),
              // const Spacer(),
              Center(child: Image(image: logo)),
              const SizedBox(height: 50),
              const Center(
                child: Text("Sign Up",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange)),
              ),
              const SizedBox(height: 50),
              CustomTextFieldWidget(
                  controller: firstNameController, labelText: "First Name"),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                  controller: lastNameController, labelText: "Last Name"),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                  controller: userNameController, labelText: "User Name"),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                  controller: emailController, labelText: "Email-Id"),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                  controller: passwordController, labelText: "Password"),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  User user = User(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    userName: userNameController.text,
                    emailId: emailController.text,
                    password: passwordController.text,
                  );
                  authBloc.add(SignUpEvent(user: user));
                },
                child: const Text("Sign Up",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(330, 60),
                    shape: const StadiumBorder(
                        // side: BorderSide()
                        )),
              ),
              const SizedBox(height: 60),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SignInScreen.route,
                        );
                      },
                      child: const Text("Sign In",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline)))
                ],
              ),
              // const Spacer(flex: 1),
            ],
          );
        },
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CustomTextFieldWidget({
    Key? key,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.green,
      autocorrect: true,

      // style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: Colors.orange,
          fontSize: 13,
        ),
        //labelStyle: TextStyle(color: Colors.blueGrey[300]),

        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.green, height: 1),
        // hintText: labelText,
        // alignLabelWithHint: true,
      ),
    );
  }
}
