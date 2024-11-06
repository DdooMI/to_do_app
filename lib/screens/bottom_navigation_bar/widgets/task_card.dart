import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_bottom_sheet_edit.dart';
import 'package:to_do_app/theme/colors.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    bool dayBefore = Provider.of<TaskProvider>(context)
        .selectedDate
        .isBefore(DateTime.now().subtract(const Duration(days: 1)));
    bool taskisDone = taskModel.isDone;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: Theme.of(context).colorScheme.onPrimary,
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: dayBefore ? 0.3 : 0.6,
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
            dayBefore
                ? Container()
                : SlidableAction(
                    onPressed: (context) async {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          context: context,
                          builder: (context) {
                            return CustomBottomSheetEdit(
                              taskModel: taskModel,
                            );
                          });
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
                  color: taskisDone
                      ? ColorsApp.greenColor
                      : Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  taskModel.name,
                  style: taskisDone
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: ColorsApp.greenColor)
                      : Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  taskModel.details,
                  style: taskisDone
                      ? Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: ColorsApp.greenColor)
                      : Theme.of(context).textTheme.titleSmall,
                ),
                trailing: Checkbox(
                    checkColor: Colors.white,
                    side: BorderSide(
                        width: 2, color: Theme.of(context).colorScheme.primary),
                    fillColor: taskisDone
                        ? WidgetStatePropertyAll(ColorsApp.greenColor)
                        : const WidgetStatePropertyAll(Colors.white),
                    value: taskModel.isDone,
                    onChanged: (value) async {
                      TaskModel editTask = taskModel.copyWith(
                          id: taskModel.id,
                          isDone: !taskModel.isDone,
                          updatedName: taskModel.name,
                          updatedDetails: taskModel.details,
                          date: taskModel.date);

                      await Provider.of<TaskProvider>(context, listen: false)
                          .editTask(editTask);
                    }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
