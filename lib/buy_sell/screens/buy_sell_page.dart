import 'package:flutter/material.dart';
import 'package:ur_buddy_3/buy_sell/screens/buy_item_page.dart';
import 'package:ur_buddy_3/buy_sell/screens/sell_item_page.dart';
import 'package:ur_buddy_3/buy_sell/screens/your_items.dart';

class BuySellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(
                  child: Text(
                "Buy",
                style: Theme.of(context).textTheme.headline6,
              )),
              Tab(
                  child: Text(
                "Sell",
                style: Theme.of(context).textTheme.headline6,
              )),
            ],
          ),
        ),
        body: TabBarView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            BuyItemPage(),
            YourItemsScreen(),
          ],
        ),
      ),
    );
  }
}
