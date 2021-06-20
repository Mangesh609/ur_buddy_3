import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/classified.dart';
import '../../buy_sell/widgets/button.dart';
import '../../buy_sell/widgets/icon.dart';
import '../../buy_sell/widgets/image.dart';
import '../../buy_sell/widgets/product_description.dart';
import '../../buy_sell/widgets/profile_pic.dart';

class ClassifiedDetailScreen extends StatelessWidget {
  static const routeName = '/classified-detail-screen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    print(args);
    final classified = args["classified"] as Classified;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 10),
            Center(
              child: ClassifiedImage(),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  child: profilepic(),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      classified.createdBy.name,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Batch'19",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    '₹ ${classified.price}',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[400],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${classified.condition}",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: icon(),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classified.title,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  classified.subTitle,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Description(classified.description),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: button(),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
