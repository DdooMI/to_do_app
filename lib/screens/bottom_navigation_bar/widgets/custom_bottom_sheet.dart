import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              AppLocalizations.of(context)!.addTask,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomTextFiled(
              controller: taskNameContorller,
              hintText: AppLocalizations.of(context)!.taskName,
              validator: (value) {
                if (value == null || value == " " || value.length < 2) {
                  return AppLocalizations.of(context)!.taskNameValidator;
                } else {
                  return null;
                }
              },
            ),
            CustomTextFiled(
              controller: taskDetailsContorller,
              hintText: AppLocalizations.of(context)!.taskDetails,
              maxLines: 5,
              validator: (value) {
                if (value == null || value == " " || value.length < 5) {
                  return AppLocalizations.of(context)!.taskdetailsValidator;
                } else {
                  return null;
                }
              },
            ),
            Text(
              AppLocalizations.of(context)!.taskDate,
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
                  text: AppLocalizations.of(context)!.add),
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
