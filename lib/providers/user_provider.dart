import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/firebase/services.dart';
import 'package:to_do_app/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  bool loading = false;
  Future login(String email, String password) async {
    loading = true;
    notifyListeners();
    try {
      loading = false;
      notifyListeners();
      userModel = await Services.login(email, password);
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
    loading = true;

    try {
      userModel = await Services.signup(userModel, password);
      notifyListeners();
    } catch (e) {
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
