// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:restaurant_app/components/my_button.dart';
import 'package:restaurant_app/components/textfield.dart';
import 'package:restaurant_app/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //register method
  void register() async {
    //get auth service
    final _authService = AuthServices();

    //check if password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.singUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }
      //display any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    //if password don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("El password no coincide"),
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
              "Crear nueva cuenta",
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

            //confirm password textfield
            Textfield(
              controller: confirmPasswordController,
              hintText: "Confirmar Password ",
              obscureText: true,
            ),

            const SizedBox(height: 25),
            //sing up button
            MyButton(
              text: "Sing Up",
              onTap: () {},
            ),

            const SizedBox(height: 25),

            //ya tienes una cuenta? Ingresa aqui
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ya tienes una cuenta?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Ingresa Ahora",
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
