import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String name;
  String details;
  DateTime date;
  bool isDone;

  TaskModel(
      {this.id = '',
      required this.name,
      required this.details,
      required this.date,
      this.isDone = false});

  TaskModel.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            name: json['name'],
            details: json['details'],
            date: (json['date'] as Timestamp).toDate(),
            isDone: json['isDone']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'details': details,
      'date': Timestamp.fromDate(date),
      'isDone': isDone
    };
  }

  TaskModel copyWith({
    String? id,
    String? updatedName,
    String? updatedDetails,
    DateTime? date,
    bool? isDone,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: updatedName ?? name,
      details: updatedDetails ?? details,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }
}
