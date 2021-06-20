import 'package:flutter/material.dart';
import 'package:ur_buddy_3/common_widgets/custom_textField.dart';

 class OrganisedRow extends StatelessWidget {
  const OrganisedRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        padding:EdgeInsets.all(15),
        width: 100,
        child: Text("Date",
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Montserrat',
              color: Theme.of(context).accentColor,
            )),
      ),
      SizedBox(width:2),
      Container(
        width: 80,
        child: CustomTextField(
          label: 'From',
        ),
      ),
      SizedBox(width: 20.0),
      Container(
        width: 80,
        child: CustomTextField(
          label: 'to',
        ),
      ),
      SizedBox(width: 90.0),
    ]);
  }
}
      
    
