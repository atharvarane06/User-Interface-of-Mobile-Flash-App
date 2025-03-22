import 'package:flutter/material.dart';
import 'package:mobile_flash_v3/ui/Buttons/buttons.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontSize: 22, color: Colors.white),),
        backgroundColor: Colors.indigoAccent,
        actions: [
          SaveButton()
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Product Categories',
            style: TextStyle(fontSize: 25, color: Colors.orange),
          ),
          SettingsProductButtons()
        ],
      ),
    );
  }
}
