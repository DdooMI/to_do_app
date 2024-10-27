import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/models/task_model.dart';

class Services {
  static CollectionReference<TaskModel> getTaskCollection() =>
      FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
          fromFirestore: (snapshot, _) =>
              TaskModel.fromJson(snapshot.data() ?? {}),
          toFirestore: (value, _) => value.toJson());

  static Future<void> addTask(TaskModel task) {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    DocumentReference<TaskModel> documentReference = tasksCollection.doc();
    task.id = documentReference.id;
    return documentReference.set(task);
  }

  static Future<void> deleteTask(String id) {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    return tasksCollection.doc(id).delete();
  }

  static Future<List<TaskModel>> getTasks() async {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskModel> taskQuery = await tasksCollection.get();
    return taskQuery.docs.map((e) => e.data()).toList();
  }

  static Future<List<TaskModel>> getTasksByDate(DateTime selectedDate) async {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    QuerySnapshot<TaskModel> taskQuery = await tasksCollection
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .get();
    return taskQuery.docs.map((e) => e.data()).toList();
  }
}
