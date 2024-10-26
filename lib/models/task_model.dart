class TaskModel {
  String name;
  String details;
  DateTime date;
  bool isDone;

  TaskModel(
      {required this.name,
      required this.details,
      required this.date,
      this.isDone = false});
}
