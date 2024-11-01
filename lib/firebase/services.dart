import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/models/user_model.dart';

class Services {
  static CollectionReference<TaskModel> getTaskCollection() =>
      getUserCollection()
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('tasks')
          .withConverter<TaskModel>(
              fromFirestore: (snapshot, _) =>
                  TaskModel.fromJson(snapshot.data() ?? {}),
              toFirestore: (value, _) => value.toJson());

  static CollectionReference<UserModel> getUserCollection() =>
      FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, _) =>
              UserModel.fromJson(snapshot.data() ?? {}),
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

  static Stream<List<TaskModel>> getTasksByDate(DateTime selectedDate) async* {
    CollectionReference<TaskModel> tasksCollection = getTaskCollection();
    Stream<QuerySnapshot<TaskModel>> taskQuery = tasksCollection
        .where('date', isEqualTo: Timestamp.fromDate(selectedDate))
        .snapshots();
    Stream<List<TaskModel>> data =
        taskQuery.map((event) => event.docs.map((e) => e.data()).toList());
    yield* data;
  }

  static Future<UserModel?> login(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return getUser();
  }

  static Future<UserModel> signup(UserModel userModel, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: userModel.email!, password: password);
    userModel.id = credential.user?.uid;
    await createUser(userModel);
    return userModel;
  }

  static Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<UserModel?> getUser() async {
    DocumentSnapshot<UserModel> documentSnapshot = await getUserCollection()
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return documentSnapshot.data();
  }

  static Future<void> createUser(UserModel userModel) async {
    return await getUserCollection().doc(userModel.id).set(userModel);
  }
}
