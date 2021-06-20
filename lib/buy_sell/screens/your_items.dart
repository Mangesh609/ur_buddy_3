import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_buddy_3/models/classified.dart';
import './sell_item_page.dart';
import '../widgets/sell_item_card.dart';

class YourItemsScreen extends StatelessWidget {
  static const routeName = '/your-items';

  @override
  Widget build(BuildContext context) {
    final userClassifieds = Provider.of<ClassifiedsProvider>(context).userClassifieds;
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            onPressed: () =>
                Navigator.of(context).pushNamed(SellItemPage.routeName),
            child: Icon(Icons.add),
          ),
          body: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) => SaleItemCard(
              title: userClassifieds[index].title,
              subtitle: userClassifieds[index].subTitle,
              imageUrl:
                  "https://rolibooks.com/wp-content/uploads/2021/01/WhatsApp-Image-2020-12-24-at-09.48.54.jpeg",
              price: userClassifieds[index].price,
              id: userClassifieds[index].id,
            ),
            itemCount: userClassifieds.length,
          )),
    );
  }
}
