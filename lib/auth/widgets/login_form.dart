import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ur_buddy_3/homepage/screens/home_screen.dart';
import '../../common_widgets/custom_flatButton.dart';
import '../../common_widgets/custom_textField.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  var _email = '';
  var _password = '';
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _logIn() {
    try {
      final isValid = _formKey.currentState.validate();
      FocusScope.of(context).unfocus();
      if (isValid) {
        _formKey.currentState.save();
        _submitLoginFormService(_email.trim(), _password.trim());
      }
    } on Exception catch (e) {
      print("ERROR : $e");
    }
  }

  /// Service function for firebase based  Login
  void _submitLoginFormService(String email,
      String password) async {
    UserCredential authResult;
    setState(() {
      _isLoading = true;
    });
    try {
      authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (authResult.user.emailVerified) {
        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
      } else {
        showDialog(context: context, builder: (BuildContext context) =>
        new AlertDialog(
          title: new Text("Confirm Email",style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),),
          content: new Text(
              "Click the link provided to your email to login"),
          actions: <Widget>[
            new TextButton(
                child: new Text("Resend"),
                onPressed: () async {
                  await authResult.user.sendEmailVerification();
                  await _auth.signOut();
                  Navigator.of(context).pop();
                }
            ),
            new TextButton(
              child: new Text("Ok"),
              onPressed: () async {
                await _auth.signOut();
                Navigator.of(context).pop();
              },
            ),
          ],
        )
        );
      }
    } catch (e) {
      var message = 'Unable to Login user.';

      if (e.message != null) {
        message = e.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme
              .of(context)
              .errorColor,
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
              label: 'Email',
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter email";
                } else if (!value.endsWith('@iiitkottayam.ac.in')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            CustomTextField(
              label: 'Password',
              isPassword: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
              isLast: true,
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
            ),
            SizedBox(height: 60),
            _isLoading ? Center(child: CircularProgressIndicator()) :
            CustomFlatButton(
              label: 'SIGN IN',
              onPressed: _logIn,
            ),
          ],
        ),
      );

    }
  }
