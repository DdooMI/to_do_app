import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)!.editTask,
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
                    text: AppLocalizations.of(context)!.save),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
