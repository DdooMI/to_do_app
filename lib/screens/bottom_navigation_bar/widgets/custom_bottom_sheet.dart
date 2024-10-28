import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_elevated_button.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_text_filed.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  TextEditingController taskNameContorller = TextEditingController();
  TextEditingController taskDetailsContorller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context, listen: false);

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
              "Add new task",
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
            Text(
              "Select Date",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            TextButton(
                onPressed: () async {
                  var date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 200)),
                    initialDate: selectedDate,
                  );
                  if (date != null) {
                    selectedDate = DateTime(date.year, date.month, date.day);
                    setState(() {});
                  }
                },
                child: Text(dateFormat.format(selectedDate))),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (formKey.currentState!.validate()) {
                            TaskModel task = TaskModel(
                                name: taskNameContorller.text.trim(),
                                details: taskDetailsContorller.text.trim(),
                                date: selectedDate);
                            setState(() {
                              isLoading = true;
                            });
                            await provider.addTask(task);
                            Navigator.of(context).pop();
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  text: 'Add'),
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
