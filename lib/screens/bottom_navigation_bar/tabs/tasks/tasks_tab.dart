import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/task_card.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(itemBuilder: (context, index) {
        return TaskCardWidget();
      }),
    );
  }
}
