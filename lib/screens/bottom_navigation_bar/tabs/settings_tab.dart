import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase/services.dart';
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
                  inactiveTrackColor: Theme.of(context).colorScheme.onSecondary,
                  activeColor: Theme.of(context).colorScheme.onSurface,
                  value: false,
                  onChanged: (value) {})),
          CustomListtileSettingsWidget(
              title: "Language",
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurface,
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
                    dropdownColor: Theme.of(context).colorScheme.surface,
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
                trailing: const Icon(
                  Icons.logout_outlined,
                  size: 40,
                )),
          ),
        ],
      ),
    );
  }
}
