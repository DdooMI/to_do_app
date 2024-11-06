import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/task_card.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: EasyInfiniteDateTimeLine(
            onDateChange: (newDate) {
              focusDate = newDate;
              Provider.of<TaskProvider>(context, listen: false)
                  .changeSelectedDate(newDate);
              setState(() {});
            },
            showTimelineHeader: false,
            firstDate: DateTime(2024),
            lastDate: DateTime(2025),
            focusDate: focusDate,
            dayProps: EasyDayProps(
                todayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
                  dayStrStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
                  monthStrStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 4)),
                ),
                inactiveDayStyle: DayStyle(
                  dayNumStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
                  dayStrStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
                  monthStrStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.secondary),
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
        StreamBuilder<List<TaskModel>?>(
            stream: Provider.of<TaskProvider>(context, listen: false)
                .getAllTasksByDate(focusDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                var data = snapshot.data;
                if (data == null || data.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "No Tasks Today",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 22),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return TaskCardWidget(
                        taskModel: data[index],
                      );
                    },
                    itemCount: data.length,
                  ),
                );
              }
            })
      ],
    );
  }
}
