import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_elevated_button.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_text_filed.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog(
      {required this.taskName,
      required this.taskDetails,
      required this.taskDate,
      super.key});
  String taskName;
  String taskDetails;
  DateTime taskDate;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController taskNameContorller = TextEditingController();
  TextEditingController taskDetailsContorller = TextEditingController();
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  @override
  Widget build(BuildContext context) {
    taskNameContorller.text = widget.taskName;
    taskDetailsContorller.text = widget.taskDetails;
    selectedDate = widget.taskDate;
    return Dialog(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.taskInfo,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            CustomTextFiled(
              readOnly: true,
              color: Theme.of(context).colorScheme.primary,
              controller: taskNameContorller,
              hintText: AppLocalizations.of(context)!.taskName,
            ),
            CustomTextFiled(
              readOnly: true,
              color: Theme.of(context).colorScheme.primary,
              controller: taskDetailsContorller,
              hintText: AppLocalizations.of(context)!.taskDetails,
              maxLines: 5,
            ),
            Text(
              AppLocalizations.of(context)!.taskDate,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Text(
              dateFormat.format(selectedDate),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 18),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: CustomElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: "ok"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
