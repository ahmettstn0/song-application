import 'package:flutter/material.dart';
import 'package:spotify_application/home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = 'ahmet';
  String _password = 'ahmet';

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
     
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(), 
            Image.asset(
              'assets/songicon.jpeg',
              height: 100, 
            ),
            SizedBox(width: 2),
            Text(
              'Song',
              style: TextStyle(
                color: Color.fromARGB(255, 32, 240, 39), 
                fontWeight: FontWeight.bold,
                height: 100,
              ),
            ),
            Spacer(flex: 2), 
          ]
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: <Widget>[
            SizedBox(height: 16.0), 
            Image.asset(
              'assets/songicon.jpeg',
              height: 400, 
            ),
            SizedBox(height: 16.0), 
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 32, 240, 39), 
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.black), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.green, width: 2.0), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.green, width: 2.0), 
                ),
              ),
              style: TextStyle(color: Colors.black), 
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _username = value;
                });
              },
            ),
            SizedBox(height: 16.0), 
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 32, 240, 39), 
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black), 
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.green, width: 2.0), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                  borderSide: BorderSide(color: Colors.green, width: 2.0), 
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.black), 
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 16.0), 
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 32, 240, 39), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
              ),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
