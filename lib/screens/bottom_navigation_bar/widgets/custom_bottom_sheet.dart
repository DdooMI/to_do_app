import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  DateTime selectedDate = DateTime.now();
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                    selectedDate = date;
                    setState(() {});
                  }
                },
                child: Text(dateFormat.format(selectedDate))),
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print("done");
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
