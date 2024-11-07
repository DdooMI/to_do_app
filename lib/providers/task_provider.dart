import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/firebase/services.dart';
import 'package:to_do_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();
  Stream<List<TaskModel>> getAllTasksByDate(DateTime selectedDate) async* {
    try {
      yield* Services.getTasksByDate(
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day));
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTask(TaskModel task) async {
    try {
      await Services.addTask(task).then((value) {
        Fluttertoast.showToast(
            msg: "Task Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> editTask(TaskModel task) async {
    try {
      await Services.editTask(task).then((value) {
        Fluttertoast.showToast(
            msg: "Task Updated",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      print("errrrrroorrr$e");
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      await Services.deleteTask(id).then((value) {
        Fluttertoast.showToast(
            msg: "Task Deleted",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  changeSelectedDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }
}
