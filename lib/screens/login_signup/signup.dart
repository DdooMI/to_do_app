import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/user_model.dart';
import 'package:to_do_app/providers/user_provider.dart';
import 'package:to_do_app/screens/login_signup/login.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_button_widget.dart';
import 'package:to_do_app/screens/login_signup/widgets/login_text_form_field_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const String routeName = "signup_screen";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  "To Do",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Column(
                  children: [
                    LoginTextFormFieldWidget(
                      controller: namecontroller,
                      hintText: "Enter your name",
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Name can't be empty";
                        } else if (value.length < 3) {
                          return "Invalid Name";
                        }
                        return null;
                      },
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
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Column(
                  children: [
                    Provider.of<UserProvider>(context, listen: false).loading
                        ? CircularProgressIndicator()
                        : LoginButtonWidget(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Provider.of<UserProvider>(context,
                                        listen: false)
                                    .signup(
                                        UserModel(
                                            name: namecontroller.text,
                                            email: emailcontroller.text),
                                        passwordcontroller.text)
                                    .then((value) {
                                  Provider.of<UserProvider>(context,
                                                  listen: false)
                                              .userModel !=
                                          null
                                      ? Navigator.of(context)
                                          .pushReplacementNamed(
                                              LoginScreen.routeName)
                                      : null;
                                });
                              }
                            },
                            text: "Sign up"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Do you have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontSize: 16),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              "Log in",
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
