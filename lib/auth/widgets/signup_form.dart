import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ur_buddy_3/auth/screens/login_screen.dart';
import '../../common_widgets/custom_flatButton.dart';
import '../../common_widgets/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  var _name = '';
  var _email = '';
  var _password = '';
  var _confirmPass = '';
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  Future<void> _signUp() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState.save();
      _submitSignupFormService(_name.trim(), _email.trim(), _password.trim());
    }
  }

  /// Service function for firebase based  sign up
  void _submitSignupFormService(
      String name, String email, String password) async {
    UserCredential authResult;
    setState(() {
      _isLoading = true;
    });
    try {
      authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("Yaha print hoga ${authResult.user.uid}");
      await FirebaseDatabase.instance
          .reference()
          .child("3users/${authResult.user.uid}")
          .set({
        "name": name,
        "email": email,
      });
      await authResult.user.sendEmailVerification();
      showDialog(
          context: context,
          builder: (BuildContext context) => new AlertDialog(
                title: new Text(
                  "Confirm Email",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                content: new Text(
                    "An email has just been sent to you, Click the link provided to complete registration"),
                actions: <Widget>[
                  new TextButton(
                    child: new Text("Ok"),
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.routeName);
                    },
                  ),
                ],
              ));
    } catch (e) {
      var message = 'Unable to create user.';

      if (e.message != null) {
        message = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            label: 'Name',
            onChanged: (value) {
              _name = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter name";
              }
              return null;
            },
          ),
          CustomTextField(
            label: 'Email',
            onChanged: (value) {
              _email = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter email";
              } else if (!value.endsWith('@iiitkottayam.ac.in')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          CustomTextField(
            isPassword: true,
            label: 'Password',
            onChanged: (value) {
              _password = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
          ),
          CustomTextField(
            isLast: true,
            isPassword: true,
            label: 'Confirm Password',
            onChanged: (value) {
              _confirmPass = value;
            },
            validator: (value) {
              if (value.isEmpty) {
                return "Please re-enter password";
              } else if (value.compareTo(_password) != 0) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
          SizedBox(height: 40),
          _isLoading ? Center(child: CircularProgressIndicator()) :
          CustomFlatButton(
            label: 'REGISTER',
            onPressed: _signUp,
          ),
        ],
      ),
    );
  }
}
