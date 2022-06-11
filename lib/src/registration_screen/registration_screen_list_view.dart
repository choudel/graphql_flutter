import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'registration_screen.dart';
import 'registration_screen_details_view.dart';

/// Displays a list of SampleItems.
class RegistrationScreenListView extends StatelessWidget {
  const RegistrationScreenListView({
    Key? key,
    this.items = const [
      RegistrationScreen(1),
      RegistrationScreen(2),
      RegistrationScreen(3)
    ],
  }) : super(key: key);

  static const routeName = '/registration';

  final List<RegistrationScreen> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I\'m fuckin amazing'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'registrationscreenListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text('Registration of MF ${item.id}'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  RegistrationScreenDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
