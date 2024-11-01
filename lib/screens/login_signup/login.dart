import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/user_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/bottom_navigator_bar.dart';
import 'package:to_do_app/screens/login_signup/signup.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_button_widget.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_text_form_field_widget.dart';
import 'package:to_do_app/theme/images.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = "login_screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                LoginTextFormFieldWidget(
                  controller: emailcontroller,
                  hintText: "Enter your email",
                  prefixIcon: Icon(
                    Icons.email,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can't be empty";
                    } else if (!isValidEmail(value)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                LoginTextFormFieldWidget(
                  controller: passwordcontroller,
                  hintText: "Enter your password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  password: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 7) {
                      return "Password should be atleast 7 characters ";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Column(
                  children: [
                    Provider.of<UserProvider>(context, listen: false).loading
                        ? const CircularProgressIndicator()
                        : LoginButtonWidget(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Provider.of<UserProvider>(context,
                                        listen: false)
                                    .login(emailcontroller.text,
                                        passwordcontroller.text)
                                    .then((value) {
                                  if (Provider.of<UserProvider>(context,
                                              listen: false)
                                          .userModel !=
                                      null) {
                                    Navigator.of(context).pushReplacementNamed(
                                        BottomNavigatorBar.routeName);
                                  }
                                });
                              }
                            },
                            text: "Log in"),
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
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(SignupScreen.routeName);
                            },
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
