import 'package:flutter/material.dart';
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
    await Services.addTask(task);
  }

  changeSelectedDate(DateTime date) async {
    selectedDate = date;
    await getAllTasksByDate();
  }
}
