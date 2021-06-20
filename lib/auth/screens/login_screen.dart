import 'package:flutter/material.dart';
import '../widgets/alternate_auth_selector_button.dart';
import '../screens/signup_screen.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "Let's sign you in.",
                      style: _theme.textTheme.headline4,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Welcome back.",
                      style: TextStyle(
                        fontSize: 30,
                        color: _theme.accentColor,
                      ),
                    ),
                    SizedBox(height: 60),
                    LogInForm(),
                    SizedBox(height: 15),
                    Center(
                      child: TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AlternateAuthSelectorButton(
              onTap: () => Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName),
              text1: 'Don’t have an account? ',
              text2: 'Register',
            )
          ],
        ),
      ),
    );
  }
}
