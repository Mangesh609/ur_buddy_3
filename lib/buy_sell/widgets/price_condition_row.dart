import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ur_buddy_3/common_widgets/custom_textField.dart';

class PriceConditionRow extends StatelessWidget {
  final Function(String value) onChangedPrice;
  final Function(String value) onChangedCondition;

  const PriceConditionRow({
    Key key,
    this.onChangedPrice,
    this.onChangedCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: CustomTextField(
        label: 'Price',
        hasPrefix: true,
        hasNumInput: true,
        fontSize: 18.0,
        prefixIcon: FontAwesomeIcons.rupeeSign,
        onChanged: onChangedPrice,
        inputFormatter: [FilteringTextInputFormatter.digitsOnly],
      ),
    );
  }
}
