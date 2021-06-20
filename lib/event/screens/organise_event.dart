import 'package:flutter/material.dart';
import 'package:ur_buddy_3/common_widgets/custom_textField.dart';
import 'package:ur_buddy_3/common_widgets/custom_flatButton.dart';

import 'organised_row.dart';

class OrganiseEvent extends StatelessWidget {
  static const routeName = '/organise-event';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Organise Event',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'Montserrat',
              letterSpacing: 1.5,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_sharp),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/new.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 380,
                child: CustomTextField(
                  label: 'Event Name',
                ),
              ),
              SizedBox(height: 5.0),
              OrganisedRow(),
              SizedBox(height: 5.0),
              Container(
                width: 380,
                child: CustomTextField(
                  maxlines: 6,
                  label: 'Description',
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 380,
                child: CustomTextField(
                  label: 'Registration Link',
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 320,
                child: CustomFlatButton(
                  label: 'ORGANISE',
                ),
              )
            ],
          ),
        ));
  }
}
