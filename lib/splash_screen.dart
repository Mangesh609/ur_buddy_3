import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/models/user.dart';

import 'auth/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homepage/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    isLoggedIn() {
      return _auth.currentUser != null;
    }

    return isLoggedIn()
        ? HomeScreen()
        : LoginScreen();
  }
}
