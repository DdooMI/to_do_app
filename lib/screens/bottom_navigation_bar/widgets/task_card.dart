import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double sheight = MediaQuery.of(context).size.height;
    double swidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      color: Theme.of(context).colorScheme.onPrimary,
      child: SizedBox(
        height: sheight * .12,
        child: Center(
          child: ListTile(
            leading: Container(
              width: 4,
              height: sheight * 0.09,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: Text(
              "Play basketball",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              "rgrgsggr",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            trailing: Container(
              width: swidth * .15,
              height: sheight * .035,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(Icons.check),
            ),
          ),
        ),
      ),
    );
  }
}
