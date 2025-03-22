import 'package:flutter/material.dart';
import 'package:mobile_flash_v3/ui/Buttons/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mobile Flash", style: TextStyle(fontSize: 30, color: Colors.white),),
          backgroundColor: Colors.teal,
          actions: [
            SettingsButton() //Settings Button used to navigate from home page to settings page
          ],
        ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 50,
                width: 500,
                color: Colors.indigoAccent,
                child: Center(child: Text("Connect Device", style: TextStyle(fontSize: 22, color: Colors.white),))
            ),
          ),
          SizedBox(height: 140,),
          ConnectButton(), //Connect Button used to navigate from home page to login popup
          Text('Connect', style: TextStyle(fontSize: 25, color: Colors.black),),
          SizedBox(height: 10,),
          Image.asset('assets/flash_disabled.jpg',width: 150, height: 150,),
          Text('Flash', style: TextStyle(fontSize: 25, color: Colors.black,),),
        ],
      )
    );
  }
}
