import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/theme/colors.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.6,
          children: [
            SlidableAction(
              onPressed: (context) async {
                Provider.of<TaskProvider>(context, listen: false)
                    .deleteTask(taskModel.id);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(12)),
            ),
            SlidableAction(
              onPressed: (context) async {
                Provider.of<TaskProvider>(context, listen: false)
                    .deleteTask(taskModel.id);
              },
              backgroundColor: ColorsApp.primaryColor,
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: sheight * .12,
            child: Center(
              child: ListTile(
                leading: Container(
                  width: 4,
                  height: sheight * 0.09,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  taskModel.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  taskModel.details,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Container(
                  width: swidth * .15,
                  height: sheight * .035,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
