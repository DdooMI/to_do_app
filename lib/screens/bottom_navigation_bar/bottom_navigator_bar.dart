import 'package:flutter/material.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/tabs/settings/settings_tab.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/tabs/tasks/tasks_tab.dart';

class BottomNavigatorBar extends StatefulWidget {
  const BottomNavigatorBar({super.key});
  static const String routeName = "BottomNavigatorBar";

  @override
  State<BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int currentIndex = 0;
  List<Widget> tabs = [const TasksTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: BottomAppBar(
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
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: "list"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: "settings")
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 35,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: tabs[currentIndex]);
  }
}
