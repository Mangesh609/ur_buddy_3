import 'package:flutter/material.dart';
import 'package:ur_buddy_3/common_widgets/custom_flatButton.dart';
import 'package:ur_buddy_3/common_widgets/custom_textField.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/edit-profile';

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name = "Enter your name here.";

  String about = "Tell us a brief about yourself.";

  String email = "Enter your email to reach you.";

  String hostel = "Give your hostel address to invite u for pamrty..";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _save() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: "name",
                  initialValue: name,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        name = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  label: "about",
                  initialValue: about,
                  maxlines: 3,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        name = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  label: "email",
                  initialValue: email,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        name = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 10),
                CustomTextField(
                  label: "hostel",
                  initialValue: hostel,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        name = value;
                      });
                    }
                  },
                ),
                SizedBox(height: 40),
                CustomFlatButton(
                  label: "Save",
                  onPressed: _save,
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
