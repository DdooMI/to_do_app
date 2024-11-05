import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_elevated_button.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_text_filed.dart';

class CustomBottomSheetEdit extends StatefulWidget {
  const CustomBottomSheetEdit({required this.taskModel, super.key});
  final TaskModel taskModel;

  @override
  State<CustomBottomSheetEdit> createState() => _CustomBottomSheetEditState();
}

class _CustomBottomSheetEditState extends State<CustomBottomSheetEdit> {
  TextEditingController taskNameContorller = TextEditingController();
  TextEditingController taskDetailsContorller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context, listen: false);
    if (!isLoading) {
      taskNameContorller.text = widget.taskModel.name;
      taskDetailsContorller.text = widget.taskModel.details;
    }

    return Padding(
      padding: EdgeInsets.only(
          top: 20.0,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Edit task",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomTextFiled(
              controller: taskNameContorller,
              hintText: "Task name",
              validator: (value) {
                if (value == null || value == " ") {
                  return 'the task name can not be empty';
                } else if (value.length < 5) {
                  return 'task name can not be less than 5';
                } else {
                  return null;
                }
              },
            ),
            CustomTextFiled(
              controller: taskDetailsContorller,
              hintText: "Task details",
              maxLines: 5,
              validator: (value) {
                if (value == null || value == " ") {
                  return 'the task details can not be empty';
                } else if (value.length < 5) {
                  return 'task details can not be less than 5';
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            TaskModel editTask = widget.taskModel.copyWith(
                                id: widget.taskModel.id,
                                updatedName: taskNameContorller.text.trim(),
                                updatedDetails:
                                    taskDetailsContorller.text.trim(),
                                date: widget.taskModel.date);
                            setState(() {
                              isLoading = true;
                            });
                            await provider.editTask(editTask);
                            Navigator.of(context).pop();

                            isLoading = false;
                          }
                        },
                  text: 'Save'),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
