import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/firebase/services.dart';
import 'package:to_do_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  bool loading = false;
  Future login(String email, String password) async {
    try {
      loading = true;
      notifyListeners();
      userModel = await Services.login(email, password);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Invalid email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future signup(UserModel userModel, String password) async {
    try {
      loading = true;
      notifyListeners();
      userModel = await Services.signup(userModel, password);
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Invalid email or password or name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
