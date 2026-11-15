import 'package:flutter/material.dart';
import '../theme/theme_manager.dart';
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() =>
      _SettingsScreenState();
}

class _SettingsScreenState
    extends State<SettingsScreen> {

  bool buttonSound = true;
  bool hapticFeedback = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xFF020817),

      appBar: AppBar(

        backgroundColor:
        const Color(0xFF020817),

        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.cyanAccent,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: ListView(

        children: [

          const SizedBox(height: 20),

          ListTile(

            leading: const Icon(
              Icons.palette,
              color: Colors.cyanAccent,
            ),

            title: const Text(
              'Theme',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            subtitle: const Text(
              'Choose Theme Color',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),

            onTap: () {

              showDialog(

                context: context,

                builder: (context) {

                  return AlertDialog(

                    title: const Text(
                      'Select Theme',
                    ),

                    content: Column(

                      mainAxisSize: MainAxisSize.min,

                      children: [

                        ListTile(

                          leading: const CircleAvatar(
                            backgroundColor:
                            Colors.cyanAccent,
                          ),

                          title:
                          const Text('Neon Cyan'),

                          onTap: () {

                            ThemeManager.primaryColor.value =
                                Colors.cyanAccent;

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(

                                content: Text(
                                  'Cyan Theme Selected',
                                ),
                              ),
                            );
                          },
                        ),

                        ListTile(

                          leading: const CircleAvatar(
                            backgroundColor:
                            Colors.purpleAccent,
                          ),

                          title:
                          const Text('Purple'),

                          onTap: () {

                            ThemeManager.primaryColor.value =
                                Colors.purpleAccent;

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(

                                content: Text(
                                  'Purple Theme Selected',
                                ),
                              ),
                            );
                          },
                        ),

                        ListTile(

                          leading: const CircleAvatar(
                            backgroundColor:
                            Colors.greenAccent,
                          ),

                          title:
                          const Text('Green'),

                          onTap: () {

                            ThemeManager.primaryColor.value =
                                Colors.greenAccent;

                            Navigator.pop(context);

                            ScaffoldMessenger.of(context)
                                .showSnackBar(

                              const SnackBar(

                                content: Text(
                                  'Green Theme Selected',
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),

          SwitchListTile(

            value: buttonSound,

            activeColor:
            Colors.cyanAccent,

            title: const Text(
              'Button Sound',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            onChanged: (value) {

              setState(() {

                buttonSound = value;
              });
            },
          ),

          SwitchListTile(

            value: hapticFeedback,

            activeColor:
            Colors.cyanAccent,

            title: const Text(
              'Haptic Feedback',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            onChanged: (value) {

              setState(() {

                hapticFeedback = value;
              });
            },
          ),

          ListTile(

            leading: const Icon(
              Icons.currency_exchange,
              color: Colors.cyanAccent,
            ),

            title: const Text(
              'Default Currency',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            subtitle: const Text(
              'BDT',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),

            onTap: () {},
          ),

          ListTile(

            leading: const Icon(
              Icons.history,
              color: Colors.cyanAccent,
            ),

            title: const Text(
              'Clear History',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            onTap: () {
              // clear history
            },
          ),

          ListTile(

            leading: const Icon(
              Icons.info_outline,
              color: Colors.cyanAccent,
            ),

            title: const Text(
              'About Nexus Calc',
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            onTap: () {

              showAboutDialog(
                context: context,
                applicationName:
                'Nexus Calc',
                applicationVersion:
                '1.0.0',
              );
            },
          ),
        ],
      ),
    );
  }
}