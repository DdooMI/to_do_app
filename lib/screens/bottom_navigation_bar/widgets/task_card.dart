import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/localization_provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_bottom_sheet_edit.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_dialog.dart';
import 'package:to_do_app/theme/colors.dart';

class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({required this.taskModel, super.key});
  final TaskModel taskModel;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;

    bool dayBefore = Provider.of<TaskProvider>(context)
        .selectedDate
        .isBefore(DateTime.now().subtract(const Duration(days: 1)));
    bool taskisDone = widget.taskModel.isDone;

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
                    .deleteTask(widget.taskModel.id);
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius: Provider.of<LocalizationProvider>(context,
                              listen: false)
                          .appLocal ==
                      "en"
                  ? const BorderRadius.horizontal(left: Radius.circular(12))
                  : const BorderRadius.horizontal(right: Radius.circular(12)),
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
                              taskModel: widget.taskModel,
                            );
                          });
                    },
                    backgroundColor: ColorsApp.primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: AppLocalizations.of(context)!.edit,
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
              child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CustomDialog(
                          taskName: widget.taskModel.name,
                          taskDetails: widget.taskModel.details,
                          taskDate: widget.taskModel.date,
                        );
                      });
                },
                child: ListTile(
                  leading: Container(
                    width: 4,
                    height: sheight * 0.09,
                    color: taskisDone
                        ? ColorsApp.greenColor
                        : Theme.of(context).colorScheme.primary,
                  ),
                  title: Text(
                    widget.taskModel.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: taskisDone
                        ? Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: ColorsApp.greenColor)
                        : Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Expanded(
                    child: Text(
                      widget.taskModel.details,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: taskisDone
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: ColorsApp.greenColor)
                          : Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  trailing: ElevatedButton(
                      onPressed: () async {
                        TaskModel editTask = widget.taskModel.copyWith(
                            id: widget.taskModel.id,
                            isDone: !widget.taskModel.isDone,
                            updatedName: widget.taskModel.name,
                            updatedDetails: widget.taskModel.details,
                            date: widget.taskModel.date);

                        await Provider.of<TaskProvider>(context, listen: false)
                            .editTask(editTask);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: taskisDone
                              ? ColorsApp.greenColor
                              : Theme.of(context).colorScheme.primary),
                      child: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 35,
                      )),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
