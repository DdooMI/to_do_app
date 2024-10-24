import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/task_card.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {
            //`selectedDate` the new date selected.
          },
          activeColor: Theme.of(context).colorScheme.primary,
          dayProps: const EasyDayProps(
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            todayHighlightColor: Color(0xffE1ECC8),
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemBuilder: (context, index) {
                return const TaskCardWidget();
              }),
        ),
      ],
    );
  }
}
