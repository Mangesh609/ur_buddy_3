import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/auth/screens/login_screen.dart';
import 'package:ur_buddy_3/models/user.dart';
import 'package:ur_buddy_3/profile/screens/edit_profile_screen.dart';
import 'package:ur_buddy_3/profile/widgets/profile_detail_widget.dart';
import '../../profile/widgets/profile_avatar.dart';

class ProfilePage extends StatelessWidget {
  String name = "Ackwickson";
  String about =
      "This is the about section of profile page here you can write in brief about yourself and go fuck you";
  String email = "ackwickson169@hotmail.com";
  String hostel = "Boys Hostel 1, BAB114";
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        leading: TextButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(EditProfile.routeName),
          child: Text(
            "Edit",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Theme.of(context).appBarTheme.iconTheme.color,
              size: 24,
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(pageBuilder: (BuildContext context,
                      Animation animation, Animation secondaryAnimation) {
                    return LoginScreen();
                  }, transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return new SlideTransition(
                      position: new Tween<Offset>(
                        begin: const Offset(1.0, 0.0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  }),
                  (Route route) => false);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileAvatar(name: user.name),
              SizedBox(height: 50),
              ProfileDetailWidget(
                field: "Name",
                value: user.name,
                icon: Icons.person_outline_outlined,
              ),
              SizedBox(height: 20),
              ProfileDetailWidget(
                field: "About",
                value: about,
                icon: Icons.info_outline,
              ),
              SizedBox(height: 20),
              ProfileDetailWidget(
                field: "Email",
                value: user.email,
                icon: Icons.email_outlined,
              ),
              SizedBox(height: 20),
              ProfileDetailWidget(
                  field: "Hostel",
                  value: hostel,
                  icon: Icons.home_work_outlined),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
