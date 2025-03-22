import 'package:flutter/material.dart';
import 'package:mobile_flash_v3/ui/ui_components/loginpopup.dart';
import 'package:mobile_flash_v3/ui/Pages/settingsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //As user will click on settings icon, settings page will get open
        onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),);
    }, child: Image.asset("assets/finalsettingicon.png"));
  }
}

class ConnectButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      //As user will click on connect button, a login popup will occur
      child: Image.asset('assets/connect_button.png', width: 150, height: 150,),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 300,
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 500,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 300,
                      width: 300,
                      child: Center(
                        child: LoginPage(),
                      ),
                    ),
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // No corner radius
                ),

              ));
          },
    );
  }
}

class SettingsProductButtons extends StatefulWidget {
  //Toggle concept is used to make appear a tick mark at rightmost corner of each button
  // after tapping on it

  @override
  State<SettingsProductButtons> createState() => _SettingsProductButtonsState();
}

class _SettingsProductButtonsState extends State<SettingsProductButtons> {
  bool selectAll = false;
  bool gensetControllerSelected = false;
  bool koelSelected = false;
  bool ehwTestCodeSelected = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // Load saved preferences
  _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectAll = prefs.getBool('selectAll') ?? false;
      gensetControllerSelected = prefs.getBool('gensetControllerSelected') ?? false;
      koelSelected = prefs.getBool('koelSelected') ?? false;
      ehwTestCodeSelected = prefs.getBool('ehwTestCodeSelected') ?? false;
    });
  }

  // Save preferences
  _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('selectAll', selectAll);
    prefs.setBool('gensetControllerSelected', gensetControllerSelected);
    prefs.setBool('koelSelected', koelSelected);
    prefs.setBool('ehwTestCodeSelected', ehwTestCodeSelected);
  }

  void toggleSelectAll() {
    setState(() {
      selectAll = !selectAll;
      gensetControllerSelected = selectAll;
      koelSelected = selectAll;
      ehwTestCodeSelected = selectAll;
    });
    _savePreferences();
  }

  void toggleGensetController() {
    setState(() {
      gensetControllerSelected = !gensetControllerSelected;
    });
    _savePreferences();
  }

  void toggleKoel() {
    setState(() {
      koelSelected = !koelSelected;
    });
    _savePreferences();
  }

  void toggleEhwTestCode() {
    setState(() {
      ehwTestCodeSelected = !ehwTestCodeSelected;
    });
    _savePreferences();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Form(
            child: Column(
              children: [
                //Select Button is defined. As user will click on select button a tick mark
                // will occur on rightmost corner of all the buttons mentioned below the select
                // button
                MaterialButton(
                    onPressed: toggleSelectAll,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SELECT ALL',
                        style: TextStyle(fontSize: 25),
                      ),
                      if (selectAll) Icon(Icons.done),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                //As user will click on GENSET CONTROLLER (GC) button a tick mark
                // will occur at rightmost corner of the button
                MaterialButton(
                    onPressed: toggleGensetController,
                  minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'GENSET CONTROLLER (GC)',
                      style: TextStyle(fontSize: 25),
                      ),
                      if (gensetControllerSelected)  Icon(Icons.done),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                //As user will click on KOEL(KG) button a tick mark
                // will occur at rightmost corner of the button
                MaterialButton(
                    onPressed: toggleKoel,
                minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'KOEL (KG)',
                        style: TextStyle(fontSize: 25),
                      ),
                      if (koelSelected) Icon(Icons.done),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                ),
                //As user will click on EHW TEST CODE (ET) button a tick mark
                // will occur at rightmost corner of the button
                MaterialButton(
                    onPressed: toggleEhwTestCode,
                minWidth: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EHW TEST CODE (ET)',
                        style: TextStyle(fontSize: 25),
                      ),
                      if (ehwTestCodeSelected) Icon(Icons.done),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.black,
                )
              ],
            )
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {
        }, child: Text("SAVE", style: TextStyle(fontSize: 22, color: Colors.white),),
        );
  }
}















