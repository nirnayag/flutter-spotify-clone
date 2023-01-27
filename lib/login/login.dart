import 'dart:html';

// import 'package:app/views/login/button.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_clone/slashcreen/slashscreen.dart';
import 'package:spotify_clone/views/home.dart';

import 'button.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = "nnn@gmail.com";
  String _password = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 500,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    child: Image.asset('assets/logo.png'),
                  ),
                  Text(
                    'Spotify',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Center(
              child: Container(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        initialValue: _email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) => _email = _email,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 25)),
                      TextFormField(
                        initialValue: _password,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = _password,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.grey.shade600),
                              ))
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 25)),
                      ElevatedButton(
                        style: primary,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            // Perform the login here
                            print('Email: $_email, Password: $_password');
                            if (_formKey.currentState.validate()) {
                              print('object');
                              var sharedpref =
                                  await SharedPreferences.getInstance();
                              sharedpref.setBool(
                                  splashscreenState.KEYLOGIN, true);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeView()));
                            } else {}
                          }
                        },
                        child: Text(
                          'Sing In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 15)),
                      Text(
                        'Be Correct With',
                        style: TextStyle(color: Color(0xff0cb560)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.g_mobiledata_outlined,
                            size: 35,
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Icon(Icons.facebook)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont Have an account? ',
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: Color(0xff0cb560)),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
