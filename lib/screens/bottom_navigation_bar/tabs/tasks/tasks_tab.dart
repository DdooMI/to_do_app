import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/task_card.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  List<TaskModel> tasks = List.generate(
      10,
      (index) => TaskModel(
          name: 'name $index',
          details: 'details $index',
          date: DateTime.now()));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: EasyInfiniteDateTimeLine(
            onDateChange: (newDate) {
              selectedDate = newDate;
              setState(() {});
            },
            showTimelineHeader: false,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
            focusDate: selectedDate,
            dayProps: EasyDayProps(
                todayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4)),
                ),
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(15)),
                ),
                activeDayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                    monthStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(15)))),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              return TaskCardWidget(
                taskModel: tasks[index],
              );
            },
            itemCount: tasks.length,
          ),
        ),
      ],
    );
  }
}
