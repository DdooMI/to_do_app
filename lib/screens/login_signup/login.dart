import 'package:flutter/material.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_button_widget.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_text_form_field_widget.dart';
import 'package:to_do_app/theme/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.2,
                  left: MediaQuery.of(context).size.width * 0.2,
                  right: MediaQuery.of(context).size.width * 0.2,
                  bottom: MediaQuery.of(context).size.width * 0.05,
                ),
                child: Image.asset(Images.login)),
            Text(
              "To Do",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            LoginTextFormFieldWidget(
              controller: emailcontroller,
              hintText: "email address",
              prefixIcon: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            LoginTextFormFieldWidget(
              controller: passwordcontroller,
              hintText: "password",
              prefixIcon: Icon(
                Icons.lock,
                color: Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility,
                    color: Theme.of(context).colorScheme.primary,
                    size: 35,
                  )),
            ),
            LoginButtonWidget(onPressed: () {}, text: "Log in"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Don't you have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Register",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 15, color: Colors.black),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
