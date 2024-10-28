import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/tabs/settings/settings_tab.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/tabs/tasks/tasks_tab.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_bottom_sheet.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_scafold_widget.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});
  static const String routeName = "BottomNavigatorBar";

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;
  List<Widget> tabs = [TasksTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return CustomScafoldWidget(
        appBar: AppBar(
          title: const Text("To Do app"),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          padding: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: "settings")
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Provider.of<TaskProvider>(context)
                  .selectedDate
                  .isBefore(DateTime.now().subtract(Duration(days: 1)))
              ? Colors.grey
              : null,
          onPressed: Provider.of<TaskProvider>(context)
                  .selectedDate
                  .isBefore(DateTime.now().subtract(Duration(days: 1)))
              ? null
              : () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      context: context,
                      builder: (context) {
                        return const CustomBottomSheet();
                      });
                },
          child: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: tabs[currentIndex]);
  }
}
