import 'package:flutter/material.dart';
import 'package:restaurant_app/components/my_drawer_title.dart';
import 'package:restaurant_app/pages/layer_page.dart';
import 'package:restaurant_app/pages/settings_page.dart';
import 'package:restaurant_app/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut() {
    final authService = AuthServices();
    authService.singOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home list title
          MyDrawerTitle(
            text: "I N I C I O",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          //settings list title
          MyDrawerTitle(
            text: "C O N F I G U R A C I Ó N",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ));
            },
          ),
          //settings list title
          MyDrawerTitle(
            text: "L A Y E R",
            icon: Icons.layers,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LayerPage(),
                  ));
            },
          ),

          const Spacer(),
          //logout list title
          MyDrawerTitle(
            text: "S A L I R",
            icon: Icons.logout,
            onTap: () {
              logOut();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
