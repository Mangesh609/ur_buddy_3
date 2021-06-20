import 'package:flutter/material.dart';
import 'package:ur_buddy_3/buy_sell/screens/classified_detail_screen.dart';
import 'package:ur_buddy_3/models/classified.dart';
import '../../constants.dart';

class BuyPageGridItem extends StatelessWidget {
  final Classified classified;
  final imageUrl;
  final int index;

  BuyPageGridItem({
    this.imageUrl,
    this.classified,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: ValueKey(classified.id),
      onTap: () {
        Navigator.of(context).pushNamed(
          ClassifiedDetailScreen.routeName,
          arguments: {"classified": classified},
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            color: colors[index % 5],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(10)),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: imageUrl == null
                        ? Image.asset(
                            "images/placeholder.png",
                            fit: BoxFit.cover,
                          )
                        : FadeInImage.assetNetwork(
                            placeholder: "images/placeholder.png",
                            image: imageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                  child: Text(
                    classified.title,
                    maxLines: 1,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text(
                    classified.subTitle,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: Text(
                    "₹ ${classified.price}",
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 15),
                    width: 100,
                    height: 34,
                    child: Center(
                      child: Text(
                        "Buy",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
