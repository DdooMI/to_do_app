import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase/services.dart';
import 'package:to_do_app/providers/dark_provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/bottom_navigation_bar/widgets/custom_listTile_settings_widget.dart';
import 'package:to_do_app/screens/login_signup/login.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomListtileSettingsWidget(
              title: "Dark Mode",
              trailing: Switch(
                  trackOutlineColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                  thumbColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                  inactiveTrackColor: Theme.of(context).colorScheme.onSecondary,
                  activeColor: Theme.of(context).colorScheme.primary,
                  value:
                      Provider.of<DarkProvider>(context, listen: false).isDark,
                  onChanged: (value) {
                    Provider.of<DarkProvider>(context, listen: false)
                        .changeThemeMode(
                            value ? ThemeMode.dark : ThemeMode.light);
                  })),
          CustomListtileSettingsWidget(
              title: "Language",
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text("English",
                            style: Theme.of(context).textTheme.bodyMedium),
                      ),
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text("Arabic",
                            style: Theme.of(context).textTheme.bodyMedium),
                      )
                    ],
                    iconEnabledColor: Theme.of(context).colorScheme.onSecondary,
                    dropdownColor: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                    underline: Container(),
                    value: "en",
                    style: Theme.of(context).textTheme.titleSmall,
                    onChanged: (value) {
                      if (value != null) {}
                    }),
              )),
          InkWell(
            onTap: () {
              Services.signout();
              Provider.of<TaskProvider>(context, listen: false).tasks.clear();
              Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
            },
            child: CustomListtileSettingsWidget(
                title: "Sign Out",
                trailing: Icon(
                  Icons.logout_outlined,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
        ],
      ),
    );
  }
}
