import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers for name and password input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLoginData(); // Load saved name and password when the page is initialized
  }

  // Load saved login data (name and password) from SharedPreferences
  _loadLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // Set the name and password from shared preferences if they exist
      _nameController.text = prefs.getString('name') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    });
  }

  // Save the entered name and password to SharedPreferences automatically when changed
  _saveLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('password', _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Name TextField with controller and hint
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                _saveLoginData();  // Automatically save name when it's changed
              },
            ),
            SizedBox(height: 10),
            // Password TextField with controller, obscure text and hint
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
              ),
              onChanged: (value) {
                _saveLoginData();  // Automatically save password when it's changed
              },
            ),
            SizedBox(height: 28), // SignInButton with validation (pass the controllers here)

            SignInButton(
              nameController: _nameController,
              passwordController: _passwordController,
            ),
            CancelButton()
          ],
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
    MaterialButton(
      // Defined cancel button. As user will click on it home page will get open
        onPressed: () {
          Navigator.pop(context);
    }, child: Text('Cancel', style: TextStyle(fontSize: 25, color: Colors.white),),
      color: Colors.grey,
    );
  }
}

class SignInButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController passwordController;

  SignInButton({required this.nameController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(

      onPressed: () {
        // Check if both name and password fields are empty
        if (nameController.text.isEmpty || passwordController.text.isEmpty) {
          // Show error dialog if fields are empty
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Please enter your data', style: TextStyle(fontSize: 20, color: Colors.red),),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the error dialog
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        } else {
          // Proceed with login or other logic here if fields are not empty
          print('Login successful!');
        }
      },
      child: Text('Sign In', style: TextStyle(fontSize: 25, color: Colors.white)),
      color: Colors.grey,
    );
  }
}

















