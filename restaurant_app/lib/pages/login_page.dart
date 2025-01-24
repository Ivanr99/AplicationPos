// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/components/textfield.dart';
import 'package:restaurant_app/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text editing Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //Login method
  void login() async {
    //get instance of auth service
    final _authService = AuthServices();

    //try sing in
    try {
      await _authService.singInWithEmailPassword(
        emailController.text,
        passwordController.text,
      );
    }

    //display any error
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 25),
            //message, app slogan
            Text(
              "Medusa Drinks ",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(height: 25),
            //email textfield
            Textfield(
              controller: emailController,
              hintText: "Email ",
              obscureText: false,
            ),

            const SizedBox(height: 25),
            //password textfield
            Textfield(
              controller: passwordController,
              hintText: "Password ",
              obscureText: true,
            ),

            const SizedBox(height: 25),
            //sing in button
            MyButton(
              text: "Ingresa",
              onTap: login,
            ),

            const SizedBox(height: 25),
            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "No eres miembro?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
