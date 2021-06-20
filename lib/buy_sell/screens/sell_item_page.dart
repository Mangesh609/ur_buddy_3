import 'package:flutter/material.dart';

import 'package:ur_buddy_3/buy_sell/widgets/sell_item_body.dart';

class SellItemPage extends StatelessWidget {
  static const routeName = '/sell-item';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sell Item'),
          elevation: 0,
        ),
        body: SellPageBody(),
      ),
    );
  }
}
