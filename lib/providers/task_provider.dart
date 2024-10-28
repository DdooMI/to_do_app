import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_app/firebase/services.dart';
import 'package:to_do_app/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  List<TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();

  Future<void> getAllTasksByDate() async {
    try {
      List<TaskModel> allTasks = await Services.getTasksByDate(
          DateTime(selectedDate.year, selectedDate.month, selectedDate.day));
      tasks = allTasks;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> addTask(TaskModel task) async {
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
    getAllTasksByDate();
  }

  changeSelectedDate(DateTime date) async {
    selectedDate = date;
    await getAllTasksByDate();
  }

  deleteTask(String id) async {
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
      getAllTasksByDate();
    } catch (e) {
      print(e);
    }
  }
}
